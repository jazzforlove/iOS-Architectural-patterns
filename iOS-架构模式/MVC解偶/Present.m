//
//  Present.m
//  iOS-架构模式
//
//  Created by 李国卿 on 2018/11/28.
//  Copyright © 2018年 Jazzfly. All rights reserved.
//

#import "Present.h"
#import "JLModel.h"


@implementation Present

- (instancetype)init{
    if (self = [super init]) {
        [self loadData];
    }
    return self;
}

- (NSMutableArray *)dataArray{
    if (!_dataArray) {
        _dataArray = [NSMutableArray array];
    }
    return _dataArray;
}

- (void)loadData{
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
        [self.dataArray addObject:model];
    }
}


@end
