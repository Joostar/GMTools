//
//  UIImage+Ext.h
//  GMTools
//
//  Created by maying on 16/4/20.
//  Copyright © 2016年 maying. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GMToolsCommonDefines.h"

@interface UIImage(gm_class(Corner))
- (UIImage *)gm_method(roundedCornerImage:(NSInteger)cornerRadius borderSize:(NSInteger)borderSize);
@end
