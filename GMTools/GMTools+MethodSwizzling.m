//
//  GMTools+MethodSwizzling.m
//  gomeTools
//
//  Created by YingMa on 16/5/22.
//  Copyright © 2016年 maying. All rights reserved.
//

#import "GMTools+MethodSwizzling.h"
#import <objc/runtime.h>
@implementation gm_class(Tools)(MethodSwizzling)
+(void)gm_method(swizzlingInstanceMethod:(Class)class originalSelector:(SEL)originalSelector alternativeSelector:(SEL)alternativeSelector)
{
    Method originalMethod = class_getInstanceMethod(class, originalSelector);
    Method alternativeMethod = class_getInstanceMethod(class, alternativeSelector);
    
    if(class_addMethod(class, originalSelector, method_getImplementation(alternativeMethod), method_getTypeEncoding(alternativeMethod)))
        class_replaceMethod(class, alternativeSelector, method_getImplementation(originalMethod), method_getTypeEncoding(originalMethod));
    else
        method_exchangeImplementations(originalMethod, alternativeMethod);
}

+(void)gm_method(swizzlingClassMethod:(Class)class originalSelector:(SEL)originalSelector alternativeSelector:(SEL)alternativeSelector)
{
    return [gm_class(Tools) gm_method(swizzlingInstanceMethod:object_getClass(class) originalSelector:originalSelector alternativeSelector:alternativeSelector)];
}

+(IMP)gm_method(swizzlingInstanceMethodIMP:(Class)class selector:(SEL)selector alternativeIMP:(IMP)alternativeIMP)
{
    return class_replaceMethod(class, selector, alternativeIMP, method_getTypeEncoding(class_getInstanceMethod(class, selector)));
    
}
+(IMP)gm_method(swizzlingClassMethodIMP:(Class)class selector:(SEL)selector alternativeIMP:(IMP)alternativeIMP)
{
    return [gm_class(Tools) gm_method(swizzlingInstanceMethodIMP:class selector:selector alternativeIMP:alternativeIMP)];
}
@end
