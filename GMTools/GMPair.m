//
//  GMPair.m
//  gomeTools
//
//  Created by YingMa on 16/5/22.
//  Copyright © 2016年 maying. All rights reserved.
//

#import "GMPair.h"

@implementation gm_class(Pair)
@synthesize gm_method(first);
@synthesize gm_method(second);

-(void)dealloc
{
    self.gm_method(first) = 0;
    self.gm_method(second) = 0;
    [super dealloc];
}
@end
