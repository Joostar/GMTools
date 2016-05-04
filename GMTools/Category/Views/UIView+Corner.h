//
//  UIView+Corner.h
//  GMTools
//
//  Created by YingMa on 16/5/3.
//  Copyright © 2016年 maying. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "GMToolsCommonDefines.h"
@interface UIView(gm_class(Corner))
//圆角
-(void)gm_method(roundedCorner:(UIRectCorner)rectCorner radius:(float)radius);
@end
