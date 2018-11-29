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
