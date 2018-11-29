//
//  MVPViewController.m
//  iOS-架构模式
//
//  Created by 李国卿 on 2018/11/29.
//  Copyright © 2018年 Jazzfly. All rights reserved.
//

#import "MVPViewController.h"
#import "JLTableViewCell.h"
#import "Present.h"
#import "JLModel.h"
#import "PresentDalegate.h"
static NSString *const identifier = @"cell";

@interface MVPViewController ()<PresentDelegate>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) JLDataSource *dataSource;
@property (nonatomic,strong)  Present *persent;

@end

@implementation MVPViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"MVP";
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.tableView];
    __weak typeof(self) weakSelf = self;
    self.dataSource = [[JLDataSource alloc]initWithIdentifier:identifier configureBlock:^(JLTableViewCell *cell, JLModel *model, NSIndexPath * _Nonnull indexPath) {
        cell.nameLab.text = model.name;
        cell.numLab.text = model.num;
        cell.num = [model.num integerValue];
        cell.indexpath = indexPath;
        cell.delegate = weakSelf.persent;
    } selectBlock:^(NSIndexPath * _Nonnull indexPath) {
        NSLog(@"%ld",indexPath.row);
    } reloadData:^(NSMutableArray * _Nonnull array) {
        [weakSelf.persent addDataArray:[array copy]];
        [weakSelf refreshView];
    }];
    [self.dataSource addDataSource:[self.persent.dataArray copy]];
    self.tableView.delegate = self.dataSource;
    self.tableView.dataSource = self.dataSource;
    
    UILabel *rightLab = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 80, 44)];
    rightLab.textAlignment = NSTextAlignmentRight;
    rightLab.textColor = [UIColor cyanColor];
    rightLab.text = [NSString stringWithFormat:@"合计: %ld",(long)[self.persent total]];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:rightLab];
    
}
#pragma mark -- PresentDelegate

- (void)reloadDataForUI{
    [self refreshView];
}
// 主控制器只负责展示更新UI
- (void)refreshView{
    [self.dataSource addDataSource:[self.persent.dataArray copy]];
    [self.tableView reloadData];
    UILabel *rightLab = self.navigationItem.rightBarButtonItem.customView;
    rightLab.text = [NSString stringWithFormat:@"合计: %ld",(long)[self.persent total]];
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
- (Present *)persent{
    if (!_persent) {
        _persent = [[Present alloc]init];
        _persent.delegate = self;
    }
    return _persent;
}



@end
