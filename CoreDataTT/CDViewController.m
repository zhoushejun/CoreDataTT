//
//  CDViewController.m
//  CoreDataTT
//
//  Created by shejun.zhou on 15/8/16.
//  Copyright (c) 2015年 shejun.zhou. All rights reserved.
//

#import "CDViewController.h"
#import "CDUserInfo.h"
#import "CDDataManager.h"

@interface CDViewController ()

@property (weak, nonatomic) IBOutlet UITextField *nameField;
@property (weak, nonatomic) IBOutlet UITextField *genderField;
@property (weak, nonatomic) IBOutlet UITextField *ageField;
@property (weak, nonatomic) IBOutlet UITextField *cidField;
@property (weak, nonatomic) IBOutlet UITextField *birthdayField;
@property (weak, nonatomic) IBOutlet UITextField *heightField;
@property (weak, nonatomic) IBOutlet UITextField *weightField;



@end

@implementation CDViewController

#pragma mark - life cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    [self.view endEditing:YES];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark - delegate


#pragma mark - event response
- (IBAction)tappedAddButtonAction:(id)sender {
    CDUserInfo *userInfo = [[CDUserInfo alloc] init];
    
    userInfo.name = [NSString stringWithFormat:@"%@", _nameField.text];
    userInfo.gender = [NSString stringWithFormat:@"%@", _genderField.text];
    userInfo.age = [NSString stringWithFormat:@"%@", _ageField.text];
    userInfo.cid = [NSString stringWithFormat:@"%@", _cidField.text];
    userInfo.birthday = [NSString stringWithFormat:@"%@", _birthdayField.text];
    userInfo.height = [NSString stringWithFormat:@"%@", _heightField.text];
    userInfo.weight = [NSString stringWithFormat:@"%@", _weightField.text];
    CDDataManager *dataManager = [CDDataManager sharedManager];
    [dataManager addUserInfoEntityWithUserInfo:userInfo];
}

- (IBAction)tappedReadButtonAction:(id)sender {
    CDDataManager *dataManager = [CDDataManager sharedManager];
    [dataManager readUserInfoEntityData];
}

#pragma mark - private methods


#pragma mark - getters and setters


@end
