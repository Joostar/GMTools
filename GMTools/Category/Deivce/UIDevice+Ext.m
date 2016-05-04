//
//  UIDevice+Ext.m
//  GMTools
//
//  Created by maying on 16/4/20.
//  Copyright © 2016年 maying. All rights reserved.
//

#import "UIDevice+Ext.h"

#import <sys/utsname.h>
//
#include <sys/socket.h> // Per msqr
#include <sys/sysctl.h>
#include <net/if.h>
#include <net/if_dl.h>


@implementation  UIDevice(gm_class(DeviceType))

+(gm_class(DeviceType)) gm_method(deviceType)
{
    struct utsname systemInfo;
    uname(&systemInfo);
    NSString *deviceString = [NSString stringWithCString:systemInfo.machine encoding:NSUTF8StringEncoding];
    
    if ([deviceString isEqualToString:@"iPhone1,1"]) return TypeIPhone2G;// @"iPhone 2G (A1203)"
    if ([deviceString isEqualToString:@"iPhone1,2"]) return TypeIPhone3G;//@"iPhone 3G (A1241/A1324)";
    if ([deviceString isEqualToString:@"iPhone2,1"]) return TypeIPhone3GS;//@"iPhone 3GS (A1303/A1325)";
    if ([deviceString isEqualToString:@"iPhone3,1"]) return TypeIPhone4;//@"iPhone 4 (A1332)";
    if ([deviceString isEqualToString:@"iPhone3,2"]) return TypeIPhone4;//@"iPhone 4 (A1332)";
    if ([deviceString isEqualToString:@"iPhone3,3"]) return TypeIPhone4;//@"iPhone 4 (A1349)";
    if ([deviceString isEqualToString:@"iPhone4,1"]) return TypeIPhone4S;//@"iPhone 4S (A1387/A1431)";
    if ([deviceString isEqualToString:@"iPhone5,1"]) return TypeIPhone5;//@"iPhone 5 (A1428)";
    if ([deviceString isEqualToString:@"iPhone5,2"]) return TypeIPhone5;//@"iPhone 5 (A1429/A1442)";
    if ([deviceString isEqualToString:@"iPhone5,3"]) return TypeIPhone5C;//@"iPhone 5c (A1456/A1532)";
    if ([deviceString isEqualToString:@"iPhone5,4"]) return TypeIPhone5C;//@"iPhone 5c (A1507/A1516/A1526/A1529)";
    if ([deviceString isEqualToString:@"iPhone6,1"]) return TypeIPhone5S;//@"iPhone 5s (A1453/A1533)";
    if ([deviceString isEqualToString:@"iPhone6,2"]) return TypeIPhone5S;//@"iPhone 5s (A1457/A1518/A1528/A1530)";
    if ([deviceString isEqualToString:@"iPhone7,1"]) return TypeIPhone6Plus;//@"iPhone 6 Plus (A1522/A1524)";
    if ([deviceString isEqualToString:@"iPhone7,2"]) return TypeIPhone6;//@"iPhone 6 (A1549/A1586)";
    if ([deviceString isEqualToString:@"iPhone8,1"])   return TypeIPhone6s;
    if ([deviceString isEqualToString:@"iPhone8,2"])   return TypeIPhone6sPlus;
    if ([deviceString hasPrefix:@"iPhone"])return TypeIPhoneOthers;
    
    
    if ([deviceString isEqualToString:@"iPod1,1"])   return TypeIPodTouch1G;//@"iPod Touch 1G (A1213)";
    if ([deviceString isEqualToString:@"iPod2,1"])   return TypeIPodTouch2G;//@"iPod Touch 2G (A1288)";
    if ([deviceString isEqualToString:@"iPod3,1"])   return TypeIPodTouch3G;//@"iPod Touch 3G (A1318)";
    if ([deviceString isEqualToString:@"iPod4,1"])   return TypeIPodTouch4G;//@"iPod Touch 4G (A1367)";
    if ([deviceString isEqualToString:@"iPod5,1"])   return TypeIPodTouch5G;//@"iPod Touch 5G (A1421/A1509)";
    if ([deviceString hasPrefix:@"iPod"])return TypeIPodOthers;
    
    
    if ([deviceString isEqualToString:@"iPad1,1"])   return TypeIPad1G;//@"iPad 1G (A1219/A1337)";
    if ([deviceString isEqualToString:@"iPad2,1"])   return TypeIPad2;//@"iPad 2 (A1395)";
    if ([deviceString isEqualToString:@"iPad2,2"])   return TypeIPad2;//@"iPad 2 (A1396)";
    if ([deviceString isEqualToString:@"iPad2,3"])   return TypeIPad2;//@"iPad 2 (A1397)";
    if ([deviceString isEqualToString:@"iPad2,4"])   return TypeIPad2;//@"iPad 2 (A1395+New Chip)";
    if ([deviceString isEqualToString:@"iPad2,5"])   return TypeIPadMini1G;//@"iPad Mini 1G (A1432)";
    if ([deviceString isEqualToString:@"iPad2,6"])   return TypeIPadMini1G;//@"iPad Mini 1G (A1454)";
    if ([deviceString isEqualToString:@"iPad2,7"])   return TypeIPadMini1G;//@"iPad Mini 1G (A1455)";
    
    if ([deviceString isEqualToString:@"iPad3,1"])   return TypeIPad3;//@"iPad 3 (A1416)";
    if ([deviceString isEqualToString:@"iPad3,2"])   return TypeIPad3;//@"iPad 3 (A1403)";
    if ([deviceString isEqualToString:@"iPad3,3"])   return TypeIPad3;//@"iPad 3 (A1430)";
    if ([deviceString isEqualToString:@"iPad3,4"])   return TypeIPad4;//@"iPad 4 (A1458)";
    if ([deviceString isEqualToString:@"iPad3,5"])   return TypeIPad4;//@"iPad 4 (A1459)";
    if ([deviceString isEqualToString:@"iPad3,6"])   return TypeIPad4;//@"iPad 4 (A1460)";
    
    if ([deviceString isEqualToString:@"iPad4,1"])   return TypeIPadAir;//@"iPad Air (A1474)";
    if ([deviceString isEqualToString:@"iPad4,2"])   return TypeIPadAir;//@"iPad Air (A1475)";
    if ([deviceString isEqualToString:@"iPad4,3"])   return TypeIPadAir;//@"iPad Air (A1476)";
    if ([deviceString isEqualToString:@"iPad4,4"])   return TypeIPadMini2G;//@"iPad Mini 2G (A1489)";
    if ([deviceString isEqualToString:@"iPad4,5"])   return TypeIPadMini2G;//@"iPad Mini 2G (A1490)";
    if ([deviceString isEqualToString:@"iPad4,6"])   return TypeIPadMini2G;//@"iPad Mini 2G (A1491)";
    if ([deviceString hasPrefix:@"iPad"])return TypeIPadOthers;
    
    
    if ([deviceString isEqualToString:@"i386"])      return TypeSimulator_i386;//@"iPhone Simulator";
    if ([deviceString isEqualToString:@"x86_64"])    return TypeSimulator_x86_64;//@"iPhone Simulator";
    
    return TypeOthers;
    
}

+(BOOL)gm_method(isIphone5OrLater)
{
    gm_class(DeviceType) type = [UIDevice gm_method(deviceType)];
    return (type >= TypeIPhone5 && type <= TypeIPhoneOthers);
}
+(BOOL)gm_method(isIphone6OrLater)
{
    gm_class(DeviceType) type = [UIDevice gm_method(deviceType)];
    return (type >= TypeIPhone6 && type <= TypeIPhoneOthers);
}


@end




@implementation UIDevice(gm_class(Macaddress))

/*
 @brief 获取mac地址，may be nil
 */
+ (NSString *) gm_method(macaddress)
{
    int                 mib[6];
    size_t              len;
    char                *buf;
    unsigned char       *ptr;
    struct if_msghdr    *ifm;
    struct sockaddr_dl  *sdl;
    
    mib[0] = CTL_NET;
    mib[1] = AF_ROUTE;
    mib[2] = 0;
    mib[3] = AF_LINK;
    mib[4] = NET_RT_IFLIST;
    
    if ((mib[5] = if_nametoindex("en0")) == 0) {
        printf("Error: if_nametoindex error\n");
        return NULL;
    }
    
    if (sysctl(mib, 6, NULL, &len, NULL, 0) < 0) {
        printf("Error: sysctl, take 1\n");
        return NULL;
    }
    
    if ((buf = malloc(len)) == NULL) {
        printf("Could not allocate memory. error!\n");
        return NULL;
    }
    
    if (sysctl(mib, 6, buf, &len, NULL, 0) < 0) {
        printf("Error: sysctl, take 2");
        free(buf);
        return NULL;
    }
    
    ifm = (struct if_msghdr *)buf;
    sdl = (struct sockaddr_dl *)(ifm + 1);
    ptr = (unsigned char *)LLADDR(sdl);
    NSString *outstring = [NSString stringWithFormat:@"%02X:%02X:%02X:%02X:%02X:%02X",
                           *ptr, *(ptr+1), *(ptr+2), *(ptr+3), *(ptr+4), *(ptr+5)];
    free(buf);
    
    return outstring;
}

@end

