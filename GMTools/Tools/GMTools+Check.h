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
//数据校验
@interface gm_class(Tools)(Check)

/*
@brief 格式化字符串  将字符串两边空格去掉
 */
+(NSString *)gm_method(trim:(NSString *)string);

/*
@brief 验证邮箱地址是否合法
 */
+(BOOL)gm_method(isValidateEmail:(NSString *)email);


/*
 @brief 比较是否为同一天
 */
//
+ (BOOL)gm_method(isSameDay:(NSDate*)date1 date2:(NSDate*)date2);

@end


@interface NSString(gm_class(Tools_Check))
-(NSString *)gm_method(trim);
-(BOOL)gm_method(isValidateEmail);
@end


@interface NSDate(gm_class(Tools_Check))
-(BOOL)gm_method(isSameDay):(NSDate*)date2;
@end
