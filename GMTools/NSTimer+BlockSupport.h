//
//  NSTimer+BlockSupport.h
//  DMCircularScrollView
//
//  Created by YingMa on 16/5/8.
//  Copyright © 2016年 Daniele Margutti. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSTimer(BlockSupport)
+ (NSTimer *)gm_scheduledTimerWithTimeInterval:(NSTimeInterval)interval
                                         block:(void(^)())block
                                       repeats:(BOOL)repeats;

+(NSTimer *)gm_timerWithTimeInterval:(NSTimeInterval)interval
                               block:(void(^)())block
                             repeats:(BOOL)yesOrNo;
@end
