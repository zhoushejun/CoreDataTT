//
//  CDUserInfo.m
//  CoreDataTT
//
//  Created by shejun.zhou on 15/8/16.
//  Copyright (c) 2015年 shejun.zhou. All rights reserved.
//

#import "CDUserInfo.h"

@implementation CDUserInfo

+ (CDUserInfo *)sharedManager {
    static CDUserInfo *manager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[[self class] alloc] init];
    });
    return manager;
}

- (instancetype) init {
    if (self = [super init]) {
        _name = [[NSString alloc] init];
        _gender = [[NSString alloc] init];
        _age = [[NSString alloc] init];
        _cid = [[NSString alloc] init];
        _birthday = [[NSString alloc] init];
        _height = [[NSString alloc] init];
        _weight = [[NSString alloc] init];
    }
    return self;
}

@end
