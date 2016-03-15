//
//  CDRootTableViewCell.h
//  CoreDataTT
//
//  Created by shejun.zhou on 15/8/16.
//  Copyright (c) 2015年 shejun.zhou. All rights reserved.
//

/**
 @file      CDRootTableViewCell.h
 @abstract  根视图 tableViewCell
 @author    shejun.zhou
 @version   1.0 15/8/16 Creation
 */
#import <UIKit/UIKit.h>

/**
 @class     CDRootTableViewCell
 @abstract  根视图 tableViewCell
 */
@interface CDRootTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *genderLabel;
@property (weak, nonatomic) IBOutlet UILabel *cidLabel;
@property (weak, nonatomic) IBOutlet UILabel *birthdayLabel;
@property (weak, nonatomic) IBOutlet UILabel *heightLabel;
@property (weak, nonatomic) IBOutlet UILabel *weightLabel;

@end
