//
//  GMTools.h
//  GMTools
//
//  Created by maying on 16/4/20.
//  Copyright © 2016年 maying. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GMTools_private.h"
#import <UIKit/UIKit.h>
#import "GMToolsCommonDefines.h"

@interface gm_class(Tools)(randomColor)
//
/*
 @brief 随机颜色
 */
+(UIColor *) gm_method(randomColor);
@end


@interface UIColor(gm_class(Tools_randomColor))
+(UIColor *) gm_method(randomColor);
@end