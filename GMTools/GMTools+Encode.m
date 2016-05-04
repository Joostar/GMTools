//
//  GMTools.m
//  GMTools
//
//  Created by maying on 16/4/20.
//  Copyright © 2016年 maying. All rights reserved.
//

#import "GMTools+Encode.h"

#import <CommonCrypto/CommonHMAC.h>
#import <CommonCrypto/CommonDigest.h>

@implementation gm_class(Tools)(Encode)
+ (NSString*)gm_method(MD5:(NSString*)input)
{
    if (!input) {
        return @"";
    }
    const char* str = [input UTF8String];
    unsigned char result[CC_MD5_DIGEST_LENGTH];
    CC_MD5(str, strlen(str), result);
    NSMutableString *ret = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH];
    
    for(int i = 0; i<CC_MD5_DIGEST_LENGTH; i++) {
        [ret appendFormat:@"%02x",result[i]];
    }
    return [[ret copy] autorelease];
}
+ (NSString*)gm_method(sha1:(NSString*)input)
{
    const char *cstr = [input cStringUsingEncoding:NSUTF8StringEncoding];
    NSData *data = [NSData dataWithBytes:cstr length:input.length];
    
    uint8_t digest[CC_SHA1_DIGEST_LENGTH];
    
    CC_SHA1(data.bytes, data.length, digest);
    
    NSMutableString* output = [NSMutableString stringWithCapacity:CC_SHA1_DIGEST_LENGTH * 2];
    
    for(int i = 0; i < CC_SHA1_DIGEST_LENGTH; i++)
        [output appendFormat:@"%02x", digest[i]];
    
    return [[output copy] autorelease];
}

+ (NSString*)gm_method(URLEncode:(NSString*)str)
{
    return [(NSString *) CFURLCreateStringByAddingPercentEscapes(NULL, (CFStringRef)[[str mutableCopy] autorelease], NULL, CFSTR("￼=,!$&'()*+;@?\n\"<>#\t :/~"),kCFStringEncodingUTF8) autorelease];
}

+ (NSString*)gm_method(URLDecoded:(NSString*)str)
{
    NSString *result = (NSString *)
    CFURLCreateStringByReplacingPercentEscapesUsingEncoding(kCFAllocatorDefault,
                                                            (CFStringRef)str,
                                                            CFSTR(""),
                                                            kCFStringEncodingUTF8);
    [result autorelease];
    return result;
}

@end





@implementation NSString(gm_class(Tools_Encode))
- (NSString*)gm_method(MD5)
{
    return [gm_class(Tools) gm_method(MD5:self)];
}
- (NSString*)gm_method(sha1)
{
    return [gm_class(Tools) gm_method(sha1:self)];
}
- (NSString*)gm_method(URLEncode)
{
    return [gm_class(Tools) gm_method(URLEncode:self)];
}
- (NSString*)gm_method(URLDecoded)
{
    return [gm_class(Tools) gm_method(URLDecoded:self)];
}
@end

