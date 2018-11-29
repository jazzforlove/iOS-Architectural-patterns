//
//  JLDataSource.m
//  iOS-架构模式
//
//  Created by 李国卿 on 2018/11/28.
//  Copyright © 2018年 Jazzfly. All rights reserved.
//
#import "JLDataSource.h"

@interface JLDataSource ()

@property (nonatomic, strong) IBInspectable NSString *identifier;

@property (nonatomic, copy) cellConfigureBefore configureBeforeBlock;

@property (nonatomic, copy) selectCell selectBlock;

@property (nonatomic, copy) reloadData reloadDataBlock;

@end

@implementation JLDataSource

- (id)initWithIdentifier:(NSString *)identifier configureBlock:(cellConfigureBefore)beforeBlock selectBlock:(selectCell)selectBlock reloadData:(reloadData)reloadDataBlock{
    self = [super init];
    if (self) {
        _identifier = identifier;
        _configureBeforeBlock = beforeBlock;
        _selectBlock = selectBlock;
        _reloadDataBlock = reloadDataBlock;
    }
    return self;
    
}
#pragma mark -- UITableViewDataSoure

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArray.count?self.dataArray.count:0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:self.identifier forIndexPath:indexPath];
    id model = [self modelsAtIndexPath:indexPath];
    if (self.configureBeforeBlock) {
        self.configureBeforeBlock(cell, model, indexPath);
    }
    return cell;
}

#pragma mark -- UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (self.selectBlock) {
        self.selectBlock(indexPath);
    }
}
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath{
    return YES;
}
//侧滑删除
- (NSArray<UITableViewRowAction *> *)tableView:(UITableView *)tableView editActionsForRowAtIndexPath:(NSIndexPath *)indexPath{
    __weak typeof(self) weakSelf = self;
    UITableViewRowAction *deleRowAction = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleDestructive title:@"删除" handler:^(UITableViewRowAction * _Nonnull action, NSIndexPath * _Nonnull indexPath) {
        [weakSelf.dataArray removeObjectAtIndex:indexPath.row];
        weakSelf.reloadDataBlock(weakSelf.dataArray);
    }];
    return @[deleRowAction];
}

#pragma mark -- UICollectionViewDataSource
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return self.dataArray.count?self.dataArray.count:0;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:self.identifier forIndexPath:indexPath];
    id model = [self modelsAtIndexPath:indexPath];
    if (self.configureBeforeBlock) {
        self.configureBeforeBlock(cell, model, indexPath);
    }
    return cell;
}
#pragma mark -- UICollectionViewDelegate
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    if (self.selectBlock) {
        self.selectBlock(indexPath);
    }
}
- (void)addDataSource:(NSArray *)array{
    if (![array count]) return;
    if (self.dataArray.count) {
        [self.dataArray removeAllObjects];
    }
    [self.dataArray addObjectsFromArray:array];
    
}
- (id)modelsAtIndexPath:(NSIndexPath *)indexPath{
    return self.dataArray.count > indexPath.row?self.dataArray[indexPath.row]:nil;
}
- (NSMutableArray *)dataArray{
    if (!_dataArray) {
        _dataArray = [NSMutableArray array];
    }
    return _dataArray;
}

@end
