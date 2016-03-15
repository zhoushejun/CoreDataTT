//
//  NSString+RegExAddition.h
//  CoreDataTT
//
//  Created by shejun.zhou on 15/8/16.
//  Copyright (c) 2015年 shejun.zhou. All rights reserved.
//

/**
 @file      NSString+RegExAddition.h
 @abstract  正则相关
 @author    shejun.zhou
 @version   1.0 15/8/16 Creation
 */
#import <Foundation/Foundation.h>

@interface NSString (RegExAddition)

/**
 * @method  isValidMobile
 * @brief	验证数字是否为正确的手机号
 * @return	YES/NO
 */
- (BOOL)isValidMobile;

/**
 * @method  isValidPassword
 * @brief	验证字符是否为正确的密码
 * @return	YES/NO
 */
- (BOOL)isValidPassword;

/**
 * @method   isNumber
 * @abstract 验证是不是数字
 * @return   YES / NO
 */
- (BOOL)isNumber;

/**
 * @method   isValidMobileCode
 * @abstract 验证是不是有效的手机验证码
 * @return   YES / NO
 */
- (BOOL)isValidMobileCode;

/**
 * @method   isValidName
 * @abstract 填写身份证真实姓名时验证是不是有效的姓名
 * @return   YES / NO
 */
- (BOOL)isValidName;

/**
 * @method   isValidCID
 * @abstract 填写身份证真实身份证号码时验证是不是有效的身份证号码
 * @return   YES / NO
 */
- (BOOL)isValidCID;

/**
 * @method   interceptBirthday
 * @abstract 从身份证号码里截取生日
 * @return   出生年月日:YYYY-MM-DD
 */
- (NSString *)interceptBirthday;

/**
 * @method   interceptGender
 * @abstract 从身份证号码里截取性别
 * @return   性别:男/女
 */
- (NSString *)interceptGender;

/**
 * @method   interceptAge
 * @abstract 从身份证号码里截取年龄
 * @return   年龄:精确到月
 */
- (NSString *)interceptAge;

@end
