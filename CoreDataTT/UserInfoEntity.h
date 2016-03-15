//
//  UserInfoEntity.h
//  CoreDataTT
//
//  Created by shejun.zhou on 15/8/16.
//  Copyright (c) 2015年 shejun.zhou. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface UserInfoEntity : NSManagedObject

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSString * age;
@property (nonatomic, retain) NSString * height;
@property (nonatomic, retain) NSString * weight;
@property (nonatomic, retain) NSString * birthday;
@property (nonatomic, retain) NSString * cid;
@property (nonatomic, retain) NSString * gender;

@end
