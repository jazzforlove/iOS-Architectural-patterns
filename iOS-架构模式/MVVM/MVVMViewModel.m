//
//  MVVMViewModel.m
//  iOS-架构模式
//
//  Created by 李国卿 on 2018/11/30.
//  Copyright © 2018年 Jazzfly. All rights reserved.
//

#import "MVVMViewModel.h"
#import "JLModel.h"

@implementation MVVMViewModel

- (instancetype)init{
    self = [super init];
    if (self) {
        // kvo监听dataArray变化
//        [self addObserver:self forKeyPath:@"dataArray" options:(NSKeyValueObservingOptionNew) context:nil];
    }
    return self;
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context{
    NSLog(@"%@",change[NSKeyValueChangeNewKey]);
    if (self.successBlock) {
        self.successBlock(change[NSKeyValueChangeNewKey]);
    }
    
    
}
- (void)loadData{
    //开启异步网络请求
    dispatch_queue_t q = dispatch_queue_create("com.ConcurrentQueue", DISPATCH_QUEUE_CONCURRENT);
    dispatch_async(q, ^{
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
        //主线程回调
        dispatch_async(dispatch_get_main_queue(), ^{
            if (self.successBlock) {
                self.successBlock(self.dataArray);
            }
        });
    });
    
}

- (void)addObjects:(NSArray *)array{
    if (!array.count) return;
    [self.dataArray removeAllObjects];
    [self.dataArray addObjectsFromArray:array];
}

- (NSMutableArray *)dataArray{
    if (!_dataArray) {
        _dataArray = [NSMutableArray array];
    }
    return _dataArray;
}

#pragma mark -- Presentdelegate

- (void)didClickAddBtnWithNum:(NSString *)num indexPath:(NSIndexPath *)indexPath;{
    // 同步model
    if (self.dataArray.count > indexPath.row) {
        JLModel *model = self.dataArray[indexPath.row];
        model.num = num;
    }
    if ([num integerValue] >=6) {
        NSArray *temArray =
        @[
          @{@"name":@"火车",@"imageUrl":@"http://CC",@"num":@"6"},
          @{@"name":@"飞机",@"imageUrl":@"http://James",@"num":@"6"},
          @{@"name":@"跑车",@"imageUrl":@"http://Gavin",@"num":@"6"},
          @{@"name":@"女票",@"imageUrl":@"http://Cooci",@"num":@"6"},
          @{@"name":@"男票",@"imageUrl":@"http://Dean ",@"num":@"6"},
          @{@"name":@"滑板",@"imageUrl":@"http://CC",@"num":@"6"},
          @{@"name":@"一日游",@"imageUrl":@"http://James",@"num":@"6"}];
        [self.dataArray removeAllObjects];
        for (NSDictionary *dict in temArray) {
            JLModel *model = [JLModel modelWithDictionary:dict];
            [self.dataArray addObject:model];
        }
    }
    if (self.successBlock) {
        self.successBlock(self.dataArray);
    }
    
}

- (void)dealloc{
    [self removeObserver:self forKeyPath:@"dataArray"];
}

@end
