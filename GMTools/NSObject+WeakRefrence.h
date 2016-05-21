//
//  NSObject+WeakRefrence.h
//  gomeTools
//
//  Created by YingMa on 16/5/22.
//  Copyright © 2016年 maying. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GMToolsCommonDefines.h"

typedef  id(^gm_class(Object))();//will return self
typedef  void(^gm_class(DestroyMethod))(gm_class(Object) object);//destroy method

@interface NSObject(gm_class(WeakRefrence))

/**
 *  return a weak-self-refrence block with a givien destroy method callback
 *
 *  @param destroyMethod the destroy method used, while self is dealloc
 */
-(gm_class(Object)) gm_method(weakSelfWithDestroyMethod:(gm_class(DestroyMethod)) destroyMethod);
@end
