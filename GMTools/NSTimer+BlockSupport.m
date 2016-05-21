//
//  NSTimer+BlockSupport.m
//  GMTools
//
//  Created by YingMa on 16/5/8.
//  Copyright © 2016年 Daniele Margutti. All rights reserved.
//

#import "NSTimer+BlockSupport.h"

@implementation NSTimer(gm_class(BlockSupport))
+ (NSTimer *)gm_method(scheduledTimerWithTimeInterval:(NSTimeInterval)interval block:(void(^)())block repeats:(BOOL)repeats)
{
    return [self scheduledTimerWithTimeInterval:interval
                                         target:self
                                       selector:@selector(gm_blockInvoke:)
                                       userInfo:[block copy]
                                        repeats:repeats];
}
+(NSTimer *)gm_method(timerWithTimeInterval:(NSTimeInterval)interval block:(void(^)())block repeats:(BOOL)yesOrNo)
{
    return [self timerWithTimeInterval:interval target:self selector:@selector(gm_blockInvoke:) userInfo:[block copy] repeats:yesOrNo];
}
+ (void)gm_blockInvoke:(NSTimer*)timer
{
    void (^block)() = timer.userInfo;
    if (block) {
        block();
    }
}
@end
