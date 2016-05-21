//
//  GMTools+MethodSwizzling.h
//  gomeTools
//
//  Created by YingMa on 16/5/22.
//  Copyright © 2016年 maying. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GMTools_private.h"
#import "GMToolsCommonDefines.h"
@interface gm_class(Tools)(MethodSwizzling)
/**
 *  交换实例方法
 *
 *  @param class               实例变量的类
 *  @param originalSelector    将被替换的selector
 *  @param alternativeSelector 用来替代的selector
 */

+(void)gm_method(swizzlingInstanceMethod:(Class)class originalSelector:(SEL)originalSelector alternativeSelector:(SEL)alternativeSelector);
/**
 *  交换类方法
 *
 *  @param class               目标类
 *  @param originalSelector    将被替换的selector
 *  @param alternativeSelector 用来替代的selector
 */
+(void)gm_method(swizzlingClassMethod:(Class)class originalSelector:(SEL)originalSelector alternativeSelector:(SEL)alternativeSelector);

/**
 *  替换实例方法的IMP
 *
 *  @param class          实例变量的类
 *  @param selector       IMP对应的selector
 *  @param alternativeIMP 新的IMP
 *
 *  @return selector对应的原来的IMP
 */
+(IMP)gm_method(swizzlingInstanceMethodIMP:(Class)class selector:(SEL)selector alternativeIMP:(IMP)alternativeIMP);

/**
 *  替换类的IMP
 *
 *  @param class          目标类
 *  @param selector       IMP对应的selector
 *  @param alternativeIMP 新的IMP
 *
 *  @return selector对应的原来的IMP
 */
+(IMP)gm_method(swizzlingClassMethodIMP:(Class)class selector:(SEL)selector alternativeIMP:(IMP)alternativeIMP);
@end
