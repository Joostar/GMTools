//
//  GMTools.m
//  GMTools
//
//  Created by maying on 16/4/20.
//  Copyright © 2016年 maying. All rights reserved.
//

#import "GMTools+Common.h"

@implementation gm_class(Tools)(Common)

+ (NSString *) gm_method(getNumStringWithNumber:(NSInteger) number)
{
    long long count = number;
    if (count < 10000) {
        return [NSString stringWithFormat:@"%ld",number];
    } else if (count < 10000000) {
        return [NSString stringWithFormat:@"%.1f万", count/10000.0];
    } else {
        return [NSString stringWithFormat:@"%.1f千万", count/10000000.0];
    }
}

@end




