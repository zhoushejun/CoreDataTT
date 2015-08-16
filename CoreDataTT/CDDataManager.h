//
//  CDDataManager.h
//  CoreDataTT
//
//  Created by shejun.zhou on 15/8/16.
//  Copyright (c) 2015年 shejun.zhou. All rights reserved.
//

/**
 @file      CDDataManager.h
 @abstract  数据库管理者
 @author    shejun.zhou
 @version   1.0 15/8/16 Creation
 */
#import <Foundation/Foundation.h>

/**
 @class     CDDataManager
 @abstract  数据库乍管理者
 */
@interface CDDataManager : NSObject

+ (CDDataManager *)sharedManager;

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;

@end
