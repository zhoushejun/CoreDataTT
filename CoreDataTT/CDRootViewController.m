//
//  CDRootViewController.m
//  CoreDataTT
//
//  Created by shejun.zhou on 15/8/16.
//  Copyright (c) 2015年 shejun.zhou. All rights reserved.
//

#import "CDRootViewController.h"
#import "CDViewController.h"
#import "CDRootTableViewCell.h"

@interface CDRootViewController ()

@end

@implementation CDRootViewController

#pragma mark - life cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *strCellId = @"CDRootTableViewCell";
    CDRootTableViewCell *cell = (CDRootTableViewCell *)[tableView dequeueReusableCellWithIdentifier:strCellId];
    cell.nameLabel.text = [NSString stringWithFormat:@"%ld", indexPath.row];
    
    return cell;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
}

#pragma mark - event response

- (IBAction)tappedRightItemAction:(id)sender {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    CDViewController *viewController = [storyboard instantiateViewControllerWithIdentifier:@"CDViewController"];
    [self.navigationController pushViewController:viewController animated:YES];
}

#pragma mark - private methods


#pragma mark - getters and setters


@end
