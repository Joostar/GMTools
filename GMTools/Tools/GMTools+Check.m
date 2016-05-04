//
//  GMTools.m
//  GMTools
//
//  Created by maying on 16/4/20.
//  Copyright © 2016年 maying. All rights reserved.
//

#import "GMTools+Check.h"

@implementation gm_class(Tools)(Check)

+(NSString *)gm_method(trim:(NSString *)string)
{
    return [string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
}

+(BOOL)gm_method(isValidateEmail:(NSString *)email)
{
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    
    return [emailTest evaluateWithObject:email];
}


+ (BOOL)gm_method(isSameDay:(NSDate*)date1 date2:(NSDate*)date2)
{
    NSCalendar* calendar = [NSCalendar currentCalendar];
    
    unsigned unitFlags = NSYearCalendarUnit | NSMonthCalendarUnit |  NSDayCalendarUnit;
    NSDateComponents* comp1 = [calendar components:unitFlags fromDate:date1];
    NSDateComponents* comp2 = [calendar components:unitFlags fromDate:date2];
    
    return [comp1 day]   == [comp2 day] &&
    [comp1 month] == [comp2 month] &&
    [comp1 year]  == [comp2 year];
}



@end






@implementation NSString(gm_class(Tools_Check))
-(NSString *)gm_method(trim)
{
    return [gm_class(Tools) gm_method(trim):self];
}
-(BOOL)gm_method(isValidateEmail)
{
    return [gm_class(Tools) gm_method(isValidateEmail):self];
}
@end


@implementation NSDate(gm_class(Tools_Check))
-(BOOL)gm_method(isSameDay):(NSDate*)date2
{
    return [gm_class(Tools) gm_method(isSameDay):self date2:date2];
}
@end





