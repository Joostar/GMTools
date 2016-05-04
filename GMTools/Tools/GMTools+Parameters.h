//
//  GMTools.h
//  GMTools
//
//  Created by maying on 16/4/20.
//  Copyright © 2016年 maying. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GMTools_private.h"

#import "UIDevice+Ext.h"
#import "A0SimpleKeychain.h"
#import "GMTools+Encode.h"

#import "GMToolsCommonDefines.h"

//获取参数
@interface gm_class(Tools)(Parameters)

/*
 @brief 获取uuid
 @warning 并不是唯一的，每次获取都会改变
 */
+ (NSString *)gm_method(uuid);//

/*
 @brief 获取udid
 @warning 并不是唯一的，每次获取都会改变
 */
+(NSString *)gm_method(udid);//

/*
 @brief 获取uuid,会存放在keychain中，唯一
 */
+(NSString *)gm_method(uuidWithKeyhain);//唯一

/*
 @brief 获取根据mac地址生成的identifier
 @warning ios7.0之后获取不到mac地址？
 */
+(NSString *)gm_method(macIdentifier);//

/*
 @brief 返回时间戳
 */
+ (NSString *)gm_method(timestamp);
/*
 @brief 返回nonce
 */
+ (NSString *)gm_method(nonce);
@end
