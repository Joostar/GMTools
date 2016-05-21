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
const static NSString * WeakRefrenceDestroyMethodsKey = @"WeakRefrenceDestroyMethodsKey";

void gm_method(weakRefrenceDealloc(NSObject * self,SEL selctor));//newDeallocMethod
static IMP OriginalDeallocIMP = 0;

@interface NSObject(gm_class(WeakRefrenceProperties))
@property(nonatomic,copy) gm_class(Object) weakSelfRefrence;
@property(nonatomic,retain) NSMutableArray * destroyMethods;
@end

@implementation NSObject(gm_class(WeakRefrenceProperties))
@dynamic weakSelfRefrence;
@dynamic destroyMethods;
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
@end


@implementation NSObject(gm_class(WeakRefrence))
+(void)load
{
    OriginalDeallocIMP = [gm_class(Tools) gm_method(swizzlingInstanceMethodIMP:self.class selector:@selector(dealloc) alternativeIMP:(IMP)(gm_method(weakRefrenceDealloc)))];
}
-(gm_class(Object)) gm_method(weakSelfWithDestroyMethod:(gm_class(DestroyMethod)) destroyMethod)
{
    if(!self.weakSelfRefrence)
    {
        self.destroyMethods = [NSMutableArray array];
        //
        __block typeof (self) weakSelf = self;
        self.weakSelfRefrence = ^id(){
            return weakSelf;
        };
    }//fi
    if(destroyMethod)
        [self.destroyMethods addObject:[destroyMethod copy]];//
    
    return self.weakSelfRefrence;
}

@end

void gm_method(weakRefrenceDealloc(NSObject * self,SEL selctor))
{
    if(self.weakSelfRefrence)
    {
        NSArray * destroyMethods = self.destroyMethods;
        for(gm_class(DestroyMethod) destroyMethod in destroyMethods)
        {
            destroyMethod(self.weakSelfRefrence);
            [destroyMethod release];
        }
        self.destroyMethods = 0;
        self.weakSelfRefrence = 0;
    }
    void (*originalDeallocIMP)(id,SEL) = (void(*)(id,SEL))(OriginalDeallocIMP);
    assert(originalDeallocIMP != 0 && "bug: OriginalDeallocIMP should not be 0");
    originalDeallocIMP(self,selctor);
}

