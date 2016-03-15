//
//  NSDate+RegexAddition.h
//  CoreDataTT
//
//  Created by shejun.zhou on 15/8/16.
//  Copyright (c) 2015年 shejun.zhou. All rights reserved.
//

/**
 @file      NSDate+RegexAddition.h
 @abstract  正则相关
 @author    shejun.zhou
 @version   1.0 15/8/16 Creation
 */
#import <Foundation/Foundation.h>

@interface NSDate (RegexAddition)

/*! @name 获取当前时间 */
// @{
+ (NSString *)currentDate;
+ (NSString *)currentMonth;
+ (NSString *)currentYear;
// @}end of 获取当前时间

@end
