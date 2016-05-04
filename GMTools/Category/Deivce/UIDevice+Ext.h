//
//  UIDevice+Ext.h
//  GMTools
//
//  Created by maying on 16/4/20.
//  Copyright © 2016年 maying. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GMToolsCommonDefines.h"

#define IS_IPHONE5_OR_LATER       [UIDevice gm_method(isIphone5OrLater)]
#define IS_IPHONE6_OR_LATER       [UIDevice gm_method(isIphone6OrLater)]

//设备类型
typedef NS_ENUM(NSInteger,gm_class(DeviceType))
{
    TypeSimulator_i386 = 0,
    TypeSimulator_x86_64 = 1,
    
    //iPhone
    TypeIPhone2G = 10000,
    TypeIPhone3G,
    TypeIPhone3GS,
    TypeIPhone4,
    TypeIPhone4S,
    TypeIPhone5,
    TypeIPhone5C,
    TypeIPhone5S,
    TypeIPhone6Plus,
    TypeIPhone6,
    TypeIPhone6s,
    TypeIPhone6sPlus,
    //
    TypeIPhoneOthers,
    
    //iPod Touch
    TypeIPodTouch1G = 20000,
    TypeIPodTouch2G,
    TypeIPodTouch3G,
    TypeIPodTouch4G,
    TypeIPodTouch5G,
    //
    TypeIPodOthers,
    
    //iPad
    TypeIPad1G = 30000,
    TypeIPad2,
    TypeIPadMini1G,
    TypeIPad3,
    TypeIPad4,
    TypeIPadAir,
    TypeIPadMini2G,
    //
    TypeIPadOthers,
    
    //others
    TypeOthers = 40000,

};

@interface UIDevice(gm_class(DeviceType))

/*
 @brief 获取设备类型
 */
+(gm_class(DeviceType))gm_method(deviceType);

/*
 @brief 是否为iPhone5以及后续版本
 */
+(BOOL)gm_method(isIphone5OrLater);
/*
 @brief 是否为iPhone6以及后续版本
 */
+(BOOL)gm_method(isIphone6OrLater);

@end




@interface UIDevice(gm_class(Macaddress))

/*
 @brief 获取mac地址，may be nil
 */
+ (NSString *) gm_method(macaddress);


@end

