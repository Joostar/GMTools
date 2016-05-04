//
//  UIView+Shadow.m
//  GMTools
//
//  Created by YingMa on 16/5/3.
//  Copyright © 2016年 maying. All rights reserved.
//

#import "UIView+Shadow.h"

@implementation UIView(gm_class(Shadow))

-(void)gm_method(shadowWidthColor:(UIColor *)color  offset:(CGSize) offset opacity:(float)opacity)
{
    UIBezierPath *shadowPath = [UIBezierPath bezierPathWithRect:self.bounds];
    self.layer.masksToBounds = NO;
    //
    self.layer.shadowColor = color.CGColor;
    self.layer.shadowOffset = offset;
    self.layer.shadowOpacity = opacity;
    self.layer.shadowPath = shadowPath.CGPath;
}

@end
