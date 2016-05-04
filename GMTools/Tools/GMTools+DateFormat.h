//
//  GMTools.h
//  GMTools
//
//  Created by maying on 16/4/20.
//  Copyright © 2016年 maying. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GMTools_private.h"
#import "GMToolsCommonDefines.h"

@interface gm_class(Tools)(DateFormat)

/*
 @brief 返回CFGregorianDate
 */
+(CFGregorianDate)gm_method(CFGregorianDateFromDate:(NSDate *)date);

/*
 @brief 将字符串转换为日期
 */
+(NSDate *)gm_method(dateFromString:(NSString *)inputDate);
/*
 @brief 将字符串转换为日期
 */
+(NSDate *)gm_method(dateFromString:(NSString *)inputDate format:(NSString *)format);


/*
 @brief 将日期转换为字符串格式
*/
+(NSString *)gm_method(stringFromDate:(NSDate *)inpuDate);

/*
 @brief 将日期转换为字符串格式
*/
+(NSString *)gm_method(stringFromDate:(NSDate *)inpuDate format:(NSString *)format);


/*
 @brief 读取day
 */
+(NSInteger)gm_method(dayFromDate:(NSDate *)date);

/*
 @brief 读取weekday
*/
+(NSInteger)gm_method(weekdayFromDate:(NSDate *)date);

//
+(int)gm_method(monthWeekday:(NSDate *)date);

@end




@interface NSString(gm_class(Tools_DateFormat))
-(NSDate *)gm_method(date);
-(NSDate *)gm_method(dateWithFormat:(NSString *)format);
@end

@interface NSDate(gm_class(Tools_DateFormat))
-(NSString *)gm_method(dateString);
-(NSString *)gm_method(dateStringWithFormat:(NSString *)format);
//
-(NSInteger)gm_method(day);
-(NSInteger)gm_method(weekday);
-(int)gm_method(monthWeekday);
@end
