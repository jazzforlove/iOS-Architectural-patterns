//
//  MVCViewController.m
//  iOS-架构模式
//
//  Created by 李国卿 on 2018/11/28.
//  Copyright © 2018年 Jazzfly. All rights reserved.
//

#import "MVCViewController.h"
#import "JLTableViewCell.h"
#import "Present.h"
#import "JLModel.h"
#import "PresentDalegate.h"
static NSString *const identifier = @"cell";

@interface MVCViewController ()<PresentDelegate>

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic,strong) NSMutableArray *dataArr;

@end

@implementation MVCViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"MVC";
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.tableView];
    
    
}

- (void)loadDataArr{
    
}


- (UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
        _tableView.backgroundColor = [UIColor colorWithRed:220 green:220 blue:221 alpha:1.0];
        _tableView.allowsSelection = NO;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [_tableView registerClass:[JLTableViewCell class] forCellReuseIdentifier:identifier];
    }
    return _tableView;
}
- (NSMutableArray *)dataArr{
    if (!_dataArr) {
        _dataArr = [NSMutableArray array];
    }
    return _dataArr;
}




@end
