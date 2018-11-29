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

static NSString *const identifier = @"cell";

@interface MVCViewController ()

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) JLDataSource *dataSource;
@property (nonatomic,strong)  Present *persent;

@end

@implementation MVCViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.tableView];
    self.dataSource = [[JLDataSource alloc]initWithIdentifier:identifier configureBlock:^(JLTableViewCell *cell, JLModel *model, NSIndexPath * _Nonnull indexPath) {
        cell.nameLab.text = model.name;
        cell.numLab.text = model.num;
        cell.num = [model.num integerValue];
        cell.indexpath = indexPath;
    } selectBlock:^(NSIndexPath * _Nonnull indexPath) {
        
    } reloadData:^(NSMutableArray * _Nonnull array) {
        
    }];
    [self.dataSource addDataSource:[self.persent.dataArray copy]];
    self.tableView.delegate = self.dataSource;
    self.tableView.dataSource = self.dataSource;
    
}
- (void)refreshView{
    
    [self.dataSource addDataSource:[self.persent.dataArray copy]];
    [self.tableView reloadData];
    
}

- (UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
        _tableView.allowsSelection = NO;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [_tableView registerClass:[JLTableViewCell class] forCellReuseIdentifier:identifier];
    }
    return _tableView;
}
- (Present *)persent{
    if (!_persent) {
        _persent = [[Present alloc]init];
    }
    return _persent;
}



@end
