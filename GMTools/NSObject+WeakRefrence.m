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
const static NSString * WeakRefrenceRemoveMethodsKey = @"WeakRefrenceRemoveMethodsKey";

void gm_method(weakRefrenceDealloc(NSObject * self,SEL selctor));//newDeallocMethod

@interface NSObject(gm_class(WeakRefrenceProperties))
@property(nonatomic,copy) gm_class(Self) weakSelfRefrence;
@property(nonatomic,assign) IMP originalDeallocIMP;
@property(nonatomic,retain) NSMutableArray * removeMethods;
@end

@implementation NSObject(gm_class(WeakRefrenceProperties))
@dynamic weakSelfRefrence;
@dynamic removeMethods;
@dynamic originalDeallocIMP;
#pragma mark properties

-(gm_class(Self))weakSelfRefrence
{
    return objc_getAssociatedObject(self, WeakSelfRefrenceKey);
}
-(void)setWeakSelfRefrence:(gm_class(Self))weakSelfRefrence
{
    objc_setAssociatedObject(self, WeakSelfRefrenceKey, weakSelfRefrence, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

-(NSMutableArray *)removeMethods
{
    return objc_getAssociatedObject(self, WeakRefrenceRemoveMethodsKey);
}
-(void)setRemoveMethods:(NSMutableArray *)removeMethods
{
    objc_setAssociatedObject(self, WeakRefrenceRemoveMethodsKey, removeMethods, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
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

-(gm_class(Self)) gm_method(weakSelfWithRemoveMethod:(gm_class(RemoveMethod)) removeMethod)
{
    static dispatch_once_t removeMethodsOnce;
    dispatch_once(&removeMethodsOnce, ^{
        self.removeMethods = [NSMutableArray array];
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
    if(removeMethod)
        [self.removeMethods addObject:[removeMethod copy]];//
    
    return self.weakSelfRefrence;
}

@end

void gm_method(weakRefrenceDealloc(NSObject * self,SEL selctor))
{
    NSArray * removeMethods = self.removeMethods;
    for(gm_class(RemoveMethod) removeMethod in removeMethods)
    {
        removeMethod(self.weakSelfRefrence);
        [removeMethod release];
    }
    self.removeMethods = 0;
    void (*originalDeallocIMP)(id,SEL) = (void(*)(id,SEL))(self.originalDeallocIMP);
    originalDeallocIMP(self,selctor);
}

