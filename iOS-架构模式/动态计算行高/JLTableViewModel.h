//
//  JLTableViewModel.h
//  iOS-架构模式
//
//  Created by 李国卿 on 2018/12/4.
//  Copyright © 2018年 Jazzfly. All rights reserved.
//

#import "MVVMBaseModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface JLTableViewModel : MVVMBaseModel

@property (nonatomic, strong) NSMutableArray *dataArray;

- (void)loadData;

@end

NS_ASSUME_NONNULL_END
