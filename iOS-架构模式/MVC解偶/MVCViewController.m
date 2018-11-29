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
#import "MVCTableViewCell.h"
static NSString *const identifier = @"mvcCell";

@interface MVCViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic,strong) NSMutableArray *dataArr;

@end

@implementation MVCViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"MVC";
    self.view.backgroundColor = [UIColor whiteColor];
    [self loadDataArr];
    [self.view addSubview:self.tableView];
}

- (void)loadDataArr{
    NSArray *temArray =
    @[
      @{@"name":@"火车",@"imageUrl":@"http://CC",@"num":@"1"},
      @{@"name":@"飞机",@"imageUrl":@"http://James",@"num":@"1"},
      @{@"name":@"跑车",@"imageUrl":@"http://Gavin",@"num":@"1"},
      @{@"name":@"女票",@"imageUrl":@"http://Cooci",@"num":@"1"},
      @{@"name":@"男票",@"imageUrl":@"http://Dean ",@"num":@"1"},
      @{@"name":@"滑板",@"imageUrl":@"http://CC",@"num":@"1"},
      @{@"name":@"一日游",@"imageUrl":@"http://James",@"num":@"1"}];
    for (NSDictionary *dict in temArray) {
        JLModel *model = [JLModel modelWithDictionary:dict];
        [self.dataArr addObject:model];
    }
}
#pragma mark - UITabelViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArr.count?self.dataArr.count:0;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    MVCTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier forIndexPath:indexPath];
    JLModel *model = self.dataArr[indexPath.row];
    cell.model = model;
    return cell;
}
#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
}
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath{
    return YES;
}
- (NSArray<UITableViewRowAction *> *)tableView:(UITableView *)tableView editActionsForRowAtIndexPath:(NSIndexPath *)indexPath{
    __weak typeof(self) weakSelf = self;
    UITableViewRowAction *actionRow = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleDestructive title:@"删除" handler:^(UITableViewRowAction * _Nonnull action, NSIndexPath * _Nonnull indexPath) {
        [weakSelf.dataArr removeObjectAtIndex:indexPath.row];
        [tableView reloadData];
    }];
    return @[actionRow];
}

- (UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
        _tableView.backgroundColor = [UIColor colorWithRed:220 green:220 blue:221 alpha:1.0];
        _tableView.allowsSelection = NO;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [_tableView registerClass:[MVCTableViewCell class] forCellReuseIdentifier:identifier];
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
