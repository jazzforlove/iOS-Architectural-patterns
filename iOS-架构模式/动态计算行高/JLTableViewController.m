//
//  JLTableViewController.m
//  iOS-架构模式
//
//  Created by 李国卿 on 2018/12/4.
//  Copyright © 2018年 Jazzfly. All rights reserved.
//

#import "JLTableViewController.h"
#import "JLContentViewCell.h"
#import "JLTableViewModel.h"
#import "JLTableModel.h"
#import "JLDataSource.h"

static NSString *const identifier = @"cell";


@interface JLTableViewController ()<UITableViewDelegate>

@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) JLDataSource *dataSource;
@property (nonatomic,strong) JLTableViewModel *viewModel;

@end

@implementation JLTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    __weak typeof(self) weakSelf = self;
    self.dataSource = [[JLDataSource alloc]initWithIdentifier:identifier configureBlock:^(JLContentViewCell *cell, JLTableModel *model, NSIndexPath * _Nonnull indexPath) {
        cell.mainLab.text = model.title;
        cell.descLab.text = model.desc;
        
    } selectBlock:^(NSIndexPath * _Nonnull indexPath) {
        
    } reloadData:^(NSMutableArray * _Nonnull array) {
        
    }];
    self.tableView.dataSource = self.dataSource;
    self.tableView.delegate = self;
    [self.viewModel initWithSuccess:^(id data) {
        [weakSelf.dataSource addDataSource:(NSArray *)data];
        [weakSelf.tableView reloadData];
    } andFailureBlock:^(id data) {
        
    }];
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    JLTableModel *model = self.dataSource.dataArray[indexPath.row];
    NSString *stateKey = nil;
    if (model.isExpand) {
        stateKey = @"expanded";
    } else {
        stateKey = @"unexpanded";
    }
    CGFloat rowHeight = [JLContentViewCell hyb_heightForTableView:tableView config:^(UITableViewCell *sourceCell) {
        JLContentViewCell *cell = (JLContentViewCell *)sourceCell;
        // 配置数据
        cell.mainLab.text = model.title;
        cell.descLab.text = model.desc;
    } cache:^NSDictionary *{
        return @{kHYBCacheUniqueKey: [NSString stringWithFormat:@"%d", model.uid],
                 kHYBCacheStateKey : stateKey,
                 // 如果设置为YES，若有缓存，则更新缓存，否则直接计算并缓存
                 // 主要是对社交这种有动态评论等不同状态，高度也会不同的情况的处理
                 kHYBRecalculateForStateKey : @(NO) // 标识不用重新更新
                 };
    }];
    NSLog(@"rowHeight--%ld",(long)rowHeight);
    return rowHeight;
}
- (UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
        _tableView.backgroundColor = [UIColor whiteColor];
        _tableView.allowsSelection = NO;
        [_tableView registerClass:[JLContentViewCell class] forCellReuseIdentifier:identifier];
    }
    return _tableView;
}

- (JLTableViewModel *)viewModel{
    if (!_viewModel) {
        _viewModel = [[JLTableViewModel alloc]init];
    }
    return _viewModel;
}


@end
