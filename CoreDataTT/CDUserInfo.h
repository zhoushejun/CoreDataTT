//
//  CDUserInfo.h
//  CoreDataTT
//
//  Created by shejun.zhou on 15/8/16.
//  Copyright (c) 2015年 shejun.zhou. All rights reserved.
//

/**
 @file      CDUserInfo.h
 @abstract  用户数据
 @author    shejun.zhou
 @version   1.0 15/8/16 Creation
 */
#import <Foundation/Foundation.h>

/**
 @class     CDUserInfo
 @abstract  用户数据
 */
@interface CDUserInfo : NSObject

@property (nonatomic, strong) NSString *name;   ///< 姓名
@property (nonatomic, strong) NSString *gender; ///< 性别
@property (nonatomic, strong) NSString *age;    ///< 年龄
@property (nonatomic, strong) NSString *cid;    ///< 身份证号码
@property (nonatomic, strong) NSString *birthday;///< 生日
@property (nonatomic, strong) NSString *height; ///< 身高
@property (nonatomic, strong) NSString *weight; ///< 体重

//+ (CDUserInfo *)sharedManager;

@end
