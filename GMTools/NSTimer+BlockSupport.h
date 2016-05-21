//
//  NSTimer+BlockSupport.h
//  GMTools
//
//  Created by YingMa on 16/5/8.
//  Copyright © 2016年 Daniele Margutti. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "GMToolsCommonDefines.h"
@interface NSTimer(gm_class(BlockSupport))

+ (NSTimer *)gm_method(scheduledTimerWithTimeInterval:(NSTimeInterval)interval block:(void(^)())block repeats:(BOOL)repeats);

+(NSTimer *)gm_method(timerWithTimeInterval:(NSTimeInterval)interval block:(void(^)())block repeats:(BOOL)yesOrNo);
@end
