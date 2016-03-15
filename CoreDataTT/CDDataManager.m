//
//  CDDataManager.m
//  CoreDataTT
//
//  Created by shejun.zhou on 15/8/16.
//  Copyright (c) 2015年 shejun.zhou. All rights reserved.
//

#import "CDDataManager.h"
#import "UserInfoEntity.h"
#import "CDUserInfo.h"

@implementation CDDataManager

@synthesize managedObjectContext = _managedObjectContext;
@synthesize managedObjectModel = _managedObjectModel;
@synthesize persistentStoreCoordinator = _persistentStoreCoordinator;


+ (CDDataManager *)sharedManager {
    static CDDataManager *manager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[[self class] alloc] init];
    });
    
    return manager;
    
}
- (void)saveContext
{
    NSError *error = nil;
    NSManagedObjectContext *managedObjectContext = self.managedObjectContext;
    if (managedObjectContext != nil) {
        if ([managedObjectContext hasChanges] && ![managedObjectContext save:&error]) {
            // Replace this implementation with code to handle the error appropriately.
            // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
            abort();
        }
    }
}

#pragma mark - Core Data stack

// Returns the managed object context for the application.
// If the context doesn't already exist, it is created and bound to the persistent store coordinator for the application.
- (NSManagedObjectContext *)managedObjectContext
{
    if (_managedObjectContext != nil) {
        return _managedObjectContext;
    }
    
    NSPersistentStoreCoordinator *coordinator = [self persistentStoreCoordinator];
    if (coordinator != nil) {
        _managedObjectContext = [[NSManagedObjectContext alloc] init];
        [_managedObjectContext setPersistentStoreCoordinator:coordinator];
    }
    return _managedObjectContext;
}

// Returns the managed object model for the application.
// If the model doesn't already exist, it is created from the application's model.
- (NSManagedObjectModel *)managedObjectModel
{
    if (_managedObjectModel != nil) {
        return _managedObjectModel;
    }
    NSURL *modelURL = [[NSBundle mainBundle] URLForResource:@"CoreDataTT" withExtension:@"momd"];
    _managedObjectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
    return _managedObjectModel;
}

// Returns the persistent store coordinator for the application.
// If the coordinator doesn't already exist, it is created and the application's store added to it.
- (NSPersistentStoreCoordinator *)persistentStoreCoordinator
{
    if (_persistentStoreCoordinator != nil) {
        return _persistentStoreCoordinator;
    }
    
    NSURL *storeURL = [[self applicationDocumentsDirectory] URLByAppendingPathComponent:@"CoreDataTT.sqlite"];
    
    NSError *error = nil;
    _persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:[self managedObjectModel]];
    if (![_persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeURL options:nil error:&error]) {
        /*
         Replace this implementation with code to handle the error appropriately.
         
         abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
         
         Typical reasons for an error here include:
         * The persistent store is not accessible;
         * The schema for the persistent store is incompatible with current managed object model.
         Check the error message to determine what the actual problem was.
         
         
         If the persistent store is not accessible, there is typically something wrong with the file path. Often, a file URL is pointing into the application's resources directory instead of a writeable directory.
         
         If you encounter schema incompatibility errors during development, you can reduce their frequency by:
         * Simply deleting the existing store:
         [[NSFileManager defaultManager] removeItemAtURL:storeURL error:nil]
         
         * Performing automatic lightweight migration by passing the following dictionary as the options parameter:
         @{NSMigratePersistentStoresAutomaticallyOption:@YES, NSInferMappingModelAutomaticallyOption:@YES}
         
         Lightweight migration will only work for a limited set of schema changes; consult "Core Data Model Versioning and Data Migration Programming Guide" for details.
         
         */
        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
        abort();
    }
    
    return _persistentStoreCoordinator;
}

#pragma mark - Application's Documents directory

// Returns the URL to the application's Documents directory.
- (NSURL *)applicationDocumentsDirectory
{
    return [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
}


#pragma mark - My mythod

- (BOOL)addUserInfoEntityWithUserInfo:(CDUserInfo *)userInfo {
    /*
    NSAssert([[dic allKeys] containsObject:@"name"],    @"dic should contain name property");
    NSAssert([[dic allKeys] containsObject:@"gender"],  @"dic should contain gender property");
    NSAssert([[dic allKeys] containsObject:@"age"],     @"dic should contain age property");
    NSAssert([[dic allKeys] containsObject:@"cid"],     @"dic should contain cid property");
    NSAssert([[dic allKeys] containsObject:@"birthday"],@"dic should contain birthday property");
    NSAssert([[dic allKeys] containsObject:@"height"],  @"dic should contain height property");
    NSAssert([[dic allKeys] containsObject:@"weight"],  @"dic should contain weight property");
    */
    UserInfoEntity *userInfoEntity = [NSEntityDescription insertNewObjectForEntityForName:@"UserInfoEntity" inManagedObjectContext:self.managedObjectContext];
        userInfoEntity.name = userInfo.name;
        userInfoEntity.gender = userInfo.gender;
        userInfoEntity.age = userInfo.age;
        userInfoEntity.cid = userInfo.cid;
        userInfoEntity.birthday = userInfo.birthday;
        userInfoEntity.height = userInfo.height;
        userInfoEntity.weight = userInfo.weight;
    
    NSError *error = nil;
    if (![self.managedObjectContext save:&error]) {
        NSLog(@"error:%@", error.description);
        return NO;
    }
    return YES;
}

- (NSArray *)readUserInfoEntityData {
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"UserInfoEntity"];    //获取请求对象
    NSSortDescriptor *ageSort = [NSSortDescriptor sortDescriptorWithKey:@"age" ascending:NO];   //降序
    request.sortDescriptors = @[ageSort];
    NSError *error = nil;
    NSMutableArray *listData = [NSMutableArray arrayWithCapacity:10];
    NSArray *users = [self.managedObjectContext executeFetchRequest:request error:&error];
    if (error) {
        NSLog(@"error:%@", error.description);
        return nil;
    }
    for (UserInfoEntity *userInfoEntity in users) {
        CDUserInfo *userInfo = [[CDUserInfo alloc] init];
        userInfo.name = userInfoEntity.name;
        userInfo.gender = userInfoEntity.gender;
        userInfo.age = userInfoEntity.age;
        userInfo.cid = userInfoEntity.cid;
        userInfo.birthday = userInfoEntity.birthday;
        userInfo.height = userInfoEntity.height;
        userInfo.weight = userInfoEntity.weight;
        [listData addObject:userInfo];
    }
    
    return listData;
}

@end
