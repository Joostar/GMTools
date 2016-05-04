//
//  UIView+Corner.m
//  GMTools
//
//  Created by YingMa on 16/5/3.
//  Copyright © 2016年 maying. All rights reserved.
//

#import "UIView+Corner.h"

@implementation UIView(gm_class(Corner))


-(void)gm_method(roundedCorner:(UIRectCorner)rectCorner radius:(float)radius)
{
    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds
                                                   byRoundingCorners:rectCorner
                                                         cornerRadii:CGSizeMake(radius, radius)];
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
    maskLayer.frame = self.bounds;
    maskLayer.path = maskPath.CGPath;
    [self.layer setMask:maskLayer];
    [maskLayer release];
}

@end
