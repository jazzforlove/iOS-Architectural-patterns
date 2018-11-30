//
//  MVVMViewController.m
//  iOS-架构模式
//
//  Created by 李国卿 on 2018/11/29.
//  Copyright © 2018年 Jazzfly. All rights reserved.
//

#import "MVVMViewController.h"
#import "MVVMViewModel.h"
#import "JLModel.h"
#import "JLTableViewCell.h"
#import "JLDataSource.h"
#import "PresentDalegate.h"

static NSString *identifier = @"mvvmCell";

@interface MVVMViewController ()<PresentDelegate>

@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) JLDataSource *dataSource;
@property (nonatomic,strong) MVVMViewModel *viewModel;
@end

@implementation MVVMViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"MVVM";
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.tableView];
    __weak typeof(self) weakSelf = self;
    self.dataSource = [[JLDataSource alloc]initWithIdentifier:identifier configureBlock:^(JLTableViewCell *cell, JLModel *model, NSIndexPath * _Nonnull indexPath) {
        cell.nameLab.text = model.name;
        cell.num = [model.num integerValue];
        cell.indexpath = indexPath;
        cell.delegate = weakSelf.viewModel;
    } selectBlock:^(NSIndexPath * _Nonnull indexPath) {
        
    } reloadData:^(NSMutableArray * _Nonnull array) {
        [weakSelf.viewModel addObjects:array];
        [weakSelf.tableView reloadData];
    }];
    self.tableView.dataSource = self.dataSource;
    self.tableView.delegate = self.dataSource;
    [self.viewModel initWithSuccess:^(id data) {
        [weakSelf.dataSource addDataSource:(NSArray *)data];
        [weakSelf.tableView reloadData];
    } andFailureBlock:^(id data) {
        
    }];
    [self.viewModel loadData];
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

- (MVVMViewModel *)viewModel{
    if (!_viewModel) {
        _viewModel = [[MVVMViewModel alloc]init];
    }
    return _viewModel;
}



@end
