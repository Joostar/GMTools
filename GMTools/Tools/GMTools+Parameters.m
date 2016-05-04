//
//  GMTools.m
//  GMTools
//
//  Created by maying on 16/4/20.
//  Copyright © 2016年 maying. All rights reserved.
//

#import "GMTools+Parameters.h"

@implementation gm_class(Tools)(Parameters)

+(NSString *)gm_method(uuid)
{
    return [[NSUUID UUID] UUIDString];
}

+ (NSString *)gm_method(udid)
{
    CFUUIDRef uuid = CFUUIDCreate(NULL);
    CFStringRef string = CFUUIDCreateString(NULL, uuid);
    NSMakeCollectable(uuid);
    NSMutableString* str = [[[NSMutableString alloc] initWithString:(NSString *)string] autorelease];
    
    CFRelease(uuid);
    CFRelease(string);
    //[str deleteCharactersInRange:NSMakeRange(13,1)];
    //[str deleteCharactersInRange:NSMakeRange(8,1)];
    return [[str copy] autorelease];
}

+(NSString *)gm_method(uuidWithKeyhain)
{
    NSString * key = NSStringFromSelector(_cmd);
    NSString *uuid = [[A0SimpleKeychain keychain] stringForKey:key];
    if(!uuid)
    {
        uuid = [self gm_method(uuid)];
        [[A0SimpleKeychain keychain] setString:uuid forKey:key];
    }
    return uuid;
}
+(NSString *)gm_method(macIdentifier)
{
    NSString * macaddress = [UIDevice gm_method(macaddress)];
    NSString *bundleIdentifier = [[NSBundle mainBundle] bundleIdentifier];
    
    NSString *stringToHash = [NSString stringWithFormat:@"%@%@",macaddress,bundleIdentifier];
    NSString *uniqueIdentifier = [stringToHash gm_method(MD5)];
    
    return uniqueIdentifier;
    
}
+ (NSString *)gm_method(timestamp)
{
    return [NSString stringWithFormat:@"%ld",time(0)];
}

+ (NSString *)gm_method(nonce)
{
    CFUUIDRef uuid = CFUUIDCreate(NULL);
    CFStringRef string = CFUUIDCreateString(NULL, uuid);
    NSMakeCollectable(uuid);
    NSMutableString* str = [[[NSMutableString alloc] initWithString:(NSString *)string] autorelease];
    
    [str deleteCharactersInRange:NSMakeRange(13,1)];
    [str deleteCharactersInRange:NSMakeRange(8,1)];
    
    CFRelease(uuid);
    CFRelease(string);
    
    return [[str copy] autorelease];
}

@end
