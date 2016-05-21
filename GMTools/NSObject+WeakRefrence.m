//
//  NSObject+WeakRefrence.m
//  gomeTools
//
//  Created by YingMa on 16/5/22.
//  Copyright © 2016年 maying. All rights reserved.
//

#import "NSObject+WeakRefrence.h"
#import <objc/runtime.h>
#import "GMTools+MethodSwizzling.h"

const static NSString * WeakSelfRefrenceKey = @"WeakSelfRefrenceKey";
const static NSString * WeakRefrenceOriginalDeallocIMPKey = @"WeakRefrenceOriginalDeallocIMPKey";
const static NSString * WeakRefrenceDestroyMethodsKey = @"WeakRefrenceDestroyMethodsKey";

void gm_method(weakRefrenceDealloc(NSObject * self,SEL selctor));//newDeallocMethod

@interface NSObject(gm_class(WeakRefrenceProperties))
@property(nonatomic,copy) gm_class(Object) weakSelfRefrence;
@property(nonatomic,assign) IMP originalDeallocIMP;
@property(nonatomic,retain) NSMutableArray * destroyMethods;
@end

@implementation NSObject(gm_class(WeakRefrenceProperties))
@dynamic weakSelfRefrence;
@dynamic destroyMethods;
@dynamic originalDeallocIMP;
#pragma mark properties

-(gm_class(Object))weakSelfRefrence
{
    return objc_getAssociatedObject(self, WeakSelfRefrenceKey);
}
-(void)setWeakSelfRefrence:(gm_class(Object))weakSelfRefrence
{
    objc_setAssociatedObject(self, WeakSelfRefrenceKey, weakSelfRefrence, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

-(NSMutableArray *)destroyMethods
{
    return objc_getAssociatedObject(self, WeakRefrenceDestroyMethodsKey);
}
-(void)setDestroyMethods:(NSMutableArray *)destroyMethods
{
    objc_setAssociatedObject(self, WeakRefrenceDestroyMethodsKey, destroyMethods, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(IMP)originalDeallocIMP
{
    return (IMP)objc_getAssociatedObject(self, WeakRefrenceOriginalDeallocIMPKey);
}
-(void)setOriginalDeallocIMP:(IMP)originalDeallocIMP
{
    objc_setAssociatedObject(self, WeakRefrenceOriginalDeallocIMPKey, (id)originalDeallocIMP, OBJC_ASSOCIATION_ASSIGN);
}
@end


@implementation NSObject(gm_class(WeakRefrence))

-(gm_class(Object)) gm_method(weakSelfWithDestroyMethod:(gm_class(DestroyMethod)) destroyMethod)
{
    static dispatch_once_t destroyMethodsOnce;
    dispatch_once(&destroyMethodsOnce, ^{
        self.destroyMethods = [NSMutableArray array];
    });
    //
    static dispatch_once_t weakSelfRefrenceOnce;
    dispatch_once(&weakSelfRefrenceOnce, ^{
        self.originalDeallocIMP = [gm_class(Tools) gm_method(swizzlingInstanceMethodIMP:self.class selector:@selector(dealloc) alternativeIMP:(IMP)(gm_method(weakRefrenceDealloc)))];
        __block typeof (self) weakSelf = self;
        self.weakSelfRefrence = ^id(){
            return weakSelf;
        };
    });
    if(destroyMethod)
        [self.destroyMethods addObject:[destroyMethod copy]];//
    
    return self.weakSelfRefrence;
}

@end

void gm_method(weakRefrenceDealloc(NSObject * self,SEL selctor))
{
    NSArray * destroyMethods = self.destroyMethods;
    for(gm_class(DestroyMethod) destroyMethod in destroyMethods)
    {
        destroyMethod(self.weakSelfRefrence);
        [destroyMethod release];
    }
    self.destroyMethods = 0;
    void (*originalDeallocIMP)(id,SEL) = (void(*)(id,SEL))(self.originalDeallocIMP);
    originalDeallocIMP(self,selctor);
}

