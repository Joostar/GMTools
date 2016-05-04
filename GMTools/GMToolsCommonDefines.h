//
//  CommonDefines.h
//  GMTools
//
//  Created by maying on 16/4/22.
//  Copyright © 2016年 maying. All rights reserved.
//

#ifndef CommonDefines_H
#define CommonDefines_H


#import <Foundation/Foundation.h>

#define USED_GM_PREFIX //使用gm前缀




#ifdef USED_GM_PREFIX

#define CLASS_NAME_WITH_PREFIX(name) GM##name
#define METHOD_NAME_WITH_PREFIX(name)gm_##name

#else

#define CLASS_NAME_WITH_PREFIX(name) name
#define METHOD_NAME_WITH_PREFIX(name)name

#endif





#define gm_class(name) CLASS_NAME_WITH_PREFIX(name)
#define gm_method(name) METHOD_NAME_WITH_PREFIX(name)







#endif