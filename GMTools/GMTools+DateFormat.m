//
//  GMTools.m
//  GMTools
//
//  Created by maying on 16/4/20.
//  Copyright © 2016年 maying. All rights reserved.
//

#import "GMTools+DateFormat.h"

@implementation gm_class(Tools)(DateFormat)

+(NSDateFormatter *)gm_method(dateFormatter)
{
    static NSDateFormatter * dateFormatter = 0;
    static dispatch_once_t once;
    dispatch_once(&once, ^{
        dateFormatter = [[NSDateFormatter alloc] init];
    });
    return dateFormatter;
}
+(NSCalendar *)gm_method(gregorianCalendar)
{
    static NSCalendar * calendar = 0;
    static dispatch_once_t once;
    dispatch_once(&once, ^{
        calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    });
    return calendar;
}

+(CFGregorianDate)gm_method(CFGregorianDateFromDate:(NSDate *)date)
{
    CFGregorianDate result;
    NSCalendar* calendar = [NSCalendar currentCalendar];
    
    unsigned unitFlags = NSYearCalendarUnit | NSMonthCalendarUnit |  NSDayCalendarUnit;
    NSDateComponents* comp1 = [calendar components:unitFlags fromDate:date];
    result.year =[comp1 year];
    result.month=[comp1 month];
    result.day=[comp1 day];
    
    return result;
}

+(NSDate *)gm_method(dateFromString:(NSString *)inputDate)
{
    return [self gm_method(dateFromString:inputDate format:@"yyyy-MM-dd HH:mm:ss")];
}
+(NSDate *)gm_method(dateFromString:(NSString *)inputDate format:(NSString *)format)
{
    NSDateFormatter *dateFormat = [self gm_method(dateFormatter)];
    [dateFormat setDateFormat:format];
    NSDate *date =[dateFormat dateFromString:inputDate];
    
    return date;
}

+(NSString *)gm_method(stringFromDate:(NSDate *)inpuDate)
{
    return [self gm_method(stringFromDate:inpuDate format:@"yyyy-MM-dd HH:mm:ss")];
}
+(NSString *)gm_method(stringFromDate:(NSDate *)inpuDate format:(NSString *)format)
{
    NSDateFormatter *dateFormat =[self gm_method(dateFormatter)];
    [dateFormat setDateFormat:format];
    NSString *result=[dateFormat stringFromDate:inpuDate];
    return result;
}


/*
 @brief 读取day
 */
+(NSInteger)gm_method(dayFromDate:(NSDate *)date)
{
    NSCalendar *calendar = [self gm_method(gregorianCalendar)];
    
    NSInteger unitFlags = NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit | NSWeekdayCalendarUnit |
    NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit;
    
    NSDateComponents *comps  = [calendar components:unitFlags fromDate:date];
    
    return [comps day];
}

/*
 @brief 读取weekday
 */
+(NSInteger)gm_method(weekdayFromDate:(NSDate *)date)
{
    NSDateFormatter *formatter =[self gm_method(dateFormatter)];
    [formatter setTimeStyle:NSDateFormatterMediumStyle];
    NSCalendar *calendar = [self gm_method(gregorianCalendar)];
    NSDateComponents *comps = [[[NSDateComponents alloc] init] autorelease];
    NSInteger unitFlags = NSYearCalendarUnit |
    NSMonthCalendarUnit |
    NSDayCalendarUnit |
    NSWeekdayCalendarUnit |
    NSHourCalendarUnit |
    NSMinuteCalendarUnit |
    NSSecondCalendarUnit;
    //int week=0;
    comps = [calendar components:unitFlags fromDate:date];
    return [comps weekday];
    
}

//
+(int)gm_method(monthWeekday:(NSDate *)date)
{
    CFGregorianDate cfDate = [self gm_method(CFGregorianDateFromDate:date)];
    CFTimeZoneRef tz = CFTimeZoneCopyDefault();
    cfDate.hour=0;
    cfDate.minute=0;
    cfDate.second=1;
    int res = (int)CFAbsoluteTimeGetDayOfWeek(CFGregorianDateGetAbsoluteTime(cfDate,tz),tz);
    CFRelease(tz);
    return res;
}

@end



@implementation NSString(gm_class(Tools_DateFormat))
-(NSDate *)gm_method(date)
{
    return [gm_class(Tools) gm_method(dateFromString:self)];
}
-(NSDate *)gm_method(dateWithFormat:(NSString *)format)
{
    return [gm_class(Tools) gm_method(dateFromString:self format:format)];
}
@end

@implementation NSDate(gm_class(Tools_DateFormat))
-(NSString *)gm_method(dateString)
{
    return [gm_class(Tools) gm_method(stringFromDate:self)];
}
-(NSString *)gm_method(dateStringWithFormat:(NSString *)format)
{
    return [gm_class(Tools) gm_method(stringFromDate:self format:format)];
}
//
-(NSInteger)gm_method(day)
{
    return [gm_class(Tools) gm_method(dayFromDate:self)];
}
-(NSInteger)gm_method(weekday)
{
    return [gm_class(Tools) gm_method(weekdayFromDate:self)];
}
-(int)gm_method(monthWeekday)
{
    return [gm_class(Tools) gm_method(monthWeekday:self)];
}
@end


