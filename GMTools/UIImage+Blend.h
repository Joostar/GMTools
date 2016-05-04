//
//  UIImage+Ext.h
//  GMTools
//
//  Created by maying on 16/4/20.
//  Copyright © 2016年 maying. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GMToolsCommonDefines.h"

@interface UIImage(gm_class(Blend))
- (UIImage *)gm_method(blendedWithImage:(UIImage *)overlayImage blendMode:(CGBlendMode)blendMode alpha:(CGFloat)alpha);
@end
