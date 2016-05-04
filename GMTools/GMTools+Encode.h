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
//加密、编码
//对于base64请用GTM
@interface gm_class(Tools)(Encode)

/*
 @brief md5加密
 */
+ (NSString*)gm_method(MD5:(NSString*)input);
/*
 @brief sha1加密
 */
+ (NSString*)gm_method(sha1:(NSString*)input);
/*
 @brief url编码
 */
+ (NSString*)gm_method(URLEncode:(NSString*)str);
/*
 @brief url解码
 */
+ (NSString*)gm_method(URLDecoded:(NSString*)str);

@end


@interface NSString(gm_class(Tools_Encode))
- (NSString*)gm_method(MD5);
- (NSString*)gm_method(sha1);
- (NSString*)gm_method(URLEncode);
- (NSString*)gm_method(URLDecoded);
@end