//
//  MVCViewController.m
//  iOS-架构模式
//
//  Created by 李国卿 on 2018/11/28.
//  Copyright © 2018年 Jazzfly. All rights reserved.
//

#import "MVCViewController.h"
#import "JLTableViewCell.h"
#import "MVCManager.h"
#import "JLModel.h"
#import "PresentDalegate.h"
#import "MVCTableViewCell.h"
static NSString *const identifier = @"mvcCell";

@interface MVCViewController ()<PresentDelegate>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) JLDataSource *dataSource;
@property (nonatomic,strong) NSMutableArray *dataArr;

@end

@implementation MVCViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"MVC";
    self.view.backgroundColor = [UIColor whiteColor];
    /*
     解耦:
     1.数据源获取抽取
     2.tableView数据源代理抽取
     3.cell与model之间解偶
     4.cell与model之间的交互通过VC中代理来实现
     */
    [self.view addSubview:self.tableView];
    __weak typeof(self) weakSelf = self;
    self.dataSource = [[JLDataSource alloc]initWithIdentifier:identifier configureBlock:^(JLTableViewCell *cell, JLModel *model, NSIndexPath * _Nonnull indexPath) {
        cell.nameLab.text = model.name;
        cell.num = [model.num integerValue];
        cell.indexpath = indexPath;
        cell.delegate = weakSelf;
    } selectBlock:^(NSIndexPath * _Nonnull indexPath) {
        NSLog(@"%ld",indexPath.row);
    } reloadData:^(NSMutableArray * _Nonnull array) {
        [[MVCManager shareManager] addDataArray:array];
        [weakSelf refreshTableView];
    }];
    [self.dataSource addDataSource:[MVCManager shareManager].dataArray];
    self.tableView.delegate = self.dataSource;
    self.tableView.dataSource = self.dataSource;
    [self setNarBarRightItem];
}
- (void)setNarBarRightItem{
    
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 80, 40)];
    label.textAlignment = NSTextAlignmentRight;
    label.textColor = [UIColor cyanColor];
    label.text = [NSString stringWithFormat:@"总计: %zd",[[MVCManager shareManager] total]];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:label];
}
- (void)refreshTableView{
    [self.tableView reloadData];
    UILabel *rightLab = self.navigationItem.rightBarButtonItem.customView;
    rightLab.text = [NSString stringWithFormat:@"总计: %zd",[[MVCManager shareManager] total]];
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
#pragma mark -- PresentDelegate

- (void)didClickAddBtnWithNum:(NSString *)num indexPath:(NSIndexPath *)indexPath{
    // 拿到数据源
    NSArray *dataArr = [MVCManager shareManager].dataArray;
    // 拿到模型
    JLModel *model  = dataArr[indexPath.row];
    // 修改模型中num中
    model.num = num;
    
    UILabel *rightLab = self.navigationItem.rightBarButtonItem.customView;
    rightLab.text = [NSString stringWithFormat:@"总计: %zd",[[MVCManager shareManager] total]];
    
}


@end
