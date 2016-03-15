//
//  NSString+RegExAddition.m
//  CoreDataTT
//
//  Created by shejun.zhou on 15/8/16.
//  Copyright (c) 2015年 shejun.zhou. All rights reserved.
//

#import "NSString+RegExAddition.h"
#import "NSDate+RegexAddition.h"

@implementation NSString (RegExAddition)


#define PREDICATE(REGEX_NAME) [[NSPredicate predicateWithFormat:@"SELF MATCHES %@", REGEX_NAME] evaluateWithObject:self]

#define MOBILE_REGEX_NAME @"^1[0-9]{10}$"           ///< 手机号码
#define NUMBER_REGEX_NAME @"^[0-9]*$"               ///< 判断是否为数字正则表达式
#define MOBILECODE_REGEX_NAME @"^[0-9]{4}$"         ///< 手机验证码正则表达式
#define PASSWORD_REGEX @"^[0-9a-zA-Z]{6,16}$"       ///< 判断登录密码、注册密码、修改密码等是不是正确格式的正则表达式
#define REAL_NAME_REGEX @"[\u4E00-\u9FA5]{2,20}"    ///< 汉字姓名正则表达式:2～20个中文字

/** 验证数字是否为正确的手机号 */
- (BOOL)isValidMobile {
    return (PREDICATE(MOBILE_REGEX_NAME));
}

/** 验证字符是否为正确的密码 */
- (BOOL)isValidPassword {
    return PREDICATE(PASSWORD_REGEX);
}

/** 验证是不是数字 */
- (BOOL)isNumber {
    return PREDICATE(NUMBER_REGEX_NAME);
}

/** 填写身份证真实姓名时验证是不是有效的姓名 */
- (BOOL)isValidName{
    return PREDICATE(REAL_NAME_REGEX);
}

- (BOOL)isValidCID {
    return isValidateIDCardNumber(self);
}

/** 验证是不是有效的手机验证码 */
- (BOOL)isValidMobileCode {
    return PREDICATE(MOBILECODE_REGEX_NAME);
}

/** 从身份证号码里截取生日 */
- (NSString *)interceptBirthday {
    if (isValidateIDCardNumber(self)) {
        return [NSString stringWithFormat:@"%@-%@-%@", [self substringWithRange:NSMakeRange(6, 4)], [self substringWithRange:NSMakeRange(10, 2)], [self substringWithRange:NSMakeRange(12, 2)]];
    }
    return @"";
}

/** 从身份证号码里截取性别 */
- (NSString *)interceptGender {
    if (isValidateIDCardNumber(self)) {
        return [[self substringWithRange:NSMakeRange(16, 1)] integerValue] % 2 == 1? @"男":@"女";
    }
    return @"";
}

/** 从身份证号码里截取年龄 */
- (NSString *)interceptAge{
    if (isValidateIDCardNumber(self)) {
        NSInteger month = [[NSDate currentMonth] integerValue];
        NSInteger year = [[NSDate currentYear] integerValue];
        NSInteger age = year - [[self substringWithRange:NSMakeRange(6, 4)] integerValue] - 1;
        if (month >= [[self substringWithRange:NSMakeRange(10, 2)] integerValue]) {
            age++;
        }
        
        return [NSString stringWithFormat:@"%ld", (long)age];
    }
    return @"";
}

/** 验证姓名长度**/
BOOL isTrueName(NSString *trueName){
    
    return (trueName.length>20||trueName.length<2)?NO:YES;
    
}

BOOL isValidateIDCardNumber(NSString *value ){
    value = [value stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    
    NSUInteger length =0;
    if (!value) {
        return NO;
    }else {
        length = value.length;
        
        if (length !=15 && length !=18) {
            return NO;
        }
    }
    // 省份代码
    NSArray *areasArray =@[@"11",@"12", @"13",@"14", @"15",@"21", @"22",@"23", @"31",@"32", @"33",@"34", @"35",@"36", @"37",@"41", @"42",@"43", @"44",@"45", @"46",@"50", @"51",@"52", @"53",@"54", @"61",@"62", @"63",@"64", @"65",@"71", @"81",@"82", @"91"];
    
    NSString *valueStart2 = [value substringToIndex:2];
    BOOL areaFlag =NO;
    for (NSString *areaCode in areasArray) {
        if ([areaCode isEqualToString:valueStart2]) {
            areaFlag =YES;
            break;
        }
    }
    
    if (!areaFlag) {
        return false;
    }
    
    
    NSRegularExpression *regularExpression;
    NSUInteger numberofMatch;
    
    int year =0;
    switch (length) {
        case 15:
            year = [value substringWithRange:NSMakeRange(6,2)].intValue +1900;
            
            if (year %4 ==0 || (year %100 ==0 && year %4 ==0)) {
                
                regularExpression = [[NSRegularExpression alloc] initWithPattern:@"^[1-9][0-9]{5}[0-9]{2}((01|03|05|07|08|10|12)(0[1-9]|[1-2][0-9]|3[0-1])|(04|06|09|11)(0[1-9]|[1-2][0-9]|30)|02(0[1-9]|[1-2][0-9]))[0-9]{3}$"
                                                                         options:NSRegularExpressionCaseInsensitive
                                                                           error:nil];//测试出生日期的合法性
            }else {
                regularExpression = [[NSRegularExpression alloc]initWithPattern:@"^[1-9][0-9]{5}[0-9]{2}((01|03|05|07|08|10|12)(0[1-9]|[1-2][0-9]|3[0-1])|(04|06|09|11)(0[1-9]|[1-2][0-9]|30)|02(0[1-9]|1[0-9]|2[0-8]))[0-9]{3}$"
                                                                        options:NSRegularExpressionCaseInsensitive
                                                                          error:nil];//测试出生日期的合法性
            }
            numberofMatch = [regularExpression numberOfMatchesInString:value
                                                               options:NSMatchingReportProgress
                                                                 range:NSMakeRange(0, value.length)];
            
            
            if(numberofMatch >0) {
                return YES;
            }else {
                return NO;
            }
        case 18:
            
            year = [value substringWithRange:NSMakeRange(6,4)].intValue;
            if (year %4 ==0 || (year %100 ==0 && year %4 ==0)) {
                
                regularExpression = [[NSRegularExpression alloc]initWithPattern:@"^[1-9][0-9]{5}19[0-9]{2}((01|03|05|07|08|10|12)(0[1-9]|[1-2][0-9]|3[0-1])|(04|06|09|11)(0[1-9]|[1-2][0-9]|30)|02(0[1-9]|[1-2][0-9]))[0-9]{3}[0-9Xx]$"
                                                                        options:NSRegularExpressionCaseInsensitive
                                                                          error:nil];//测试出生日期的合法性
            }else {
                regularExpression = [[NSRegularExpression alloc]initWithPattern:@"^[1-9][0-9]{5}19[0-9]{2}((01|03|05|07|08|10|12)(0[1-9]|[1-2][0-9]|3[0-1])|(04|06|09|11)(0[1-9]|[1-2][0-9]|30)|02(0[1-9]|1[0-9]|2[0-8]))[0-9]{3}[0-9Xx]$"
                                                                        options:NSRegularExpressionCaseInsensitive
                                                                          error:nil];//测试出生日期的合法性
            }
            numberofMatch = [regularExpression numberOfMatchesInString:value
                                                               options:NSMatchingReportProgress
                                                                 range:NSMakeRange(0, value.length)];
            
            
            if(numberofMatch >0) {
                int S = ([value substringWithRange:NSMakeRange(0,1)].intValue + [value substringWithRange:NSMakeRange(10,1)].intValue) *7 + ([value substringWithRange:NSMakeRange(1,1)].intValue + [value substringWithRange:NSMakeRange(11,1)].intValue) *9 + ([value substringWithRange:NSMakeRange(2,1)].intValue + [value substringWithRange:NSMakeRange(12,1)].intValue) *10 + ([value substringWithRange:NSMakeRange(3,1)].intValue + [value substringWithRange:NSMakeRange(13,1)].intValue) *5 + ([value substringWithRange:NSMakeRange(4,1)].intValue + [value substringWithRange:NSMakeRange(14,1)].intValue) *8 + ([value substringWithRange:NSMakeRange(5,1)].intValue + [value substringWithRange:NSMakeRange(15,1)].intValue) *4 + ([value substringWithRange:NSMakeRange(6,1)].intValue + [value substringWithRange:NSMakeRange(16,1)].intValue) *2 + [value substringWithRange:NSMakeRange(7,1)].intValue *1 + [value substringWithRange:NSMakeRange(8,1)].intValue *6 + [value substringWithRange:NSMakeRange(9,1)].intValue *3;
                int Y = S %11;
                NSString *M =@"F";
                NSString *JYM =@"10X98765432";
                M = [JYM substringWithRange:NSMakeRange(Y,1)];// 判断校验位
                if ([M isEqualToString:[value substringWithRange:NSMakeRange(17,1)]]) {
                    return YES;// 检测ID的校验位
                }else {
                    return NO;
                }
                
            }else {
                return NO;
            }
        default:
            return false;
    }
}

@end
