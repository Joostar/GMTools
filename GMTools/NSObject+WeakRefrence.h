//
//  NSObject+WeakRefrence.h
//  gomeTools
//
//  Created by YingMa on 16/5/22.
//  Copyright © 2016年 maying. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GMToolsCommonDefines.h"

typedef  id(^gm_class(Self))();//will return self
typedef  void(^gm_class(RemoveMethod))(gm_class(Self) objectSelf);//remove method

@interface NSObject(gm_class(WeakRefrence))

/**
 *  return a weak-self-refrence block with a givien remove method callback
 *
 *  @param removeMethod the remove method used, while self is dealloc
 */
-(gm_class(Self)) gm_method(weakSelf:(gm_class(RemoveMethod)) removeMethod);
@end
