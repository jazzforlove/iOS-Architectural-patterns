//
//  MVVMViewModel.h
//  iOS-架构模式
//
//  Created by 李国卿 on 2018/11/30.
//  Copyright © 2018年 Jazzfly. All rights reserved.
//

#import "MVVMBaseModel.h"
#import "PresentDalegate.h"

NS_ASSUME_NONNULL_BEGIN

@interface MVVMViewModel : MVVMBaseModel<PresentDelegate>

@property (nonatomic,strong) NSMutableArray *dataArray;

- (void)loadData;

- (void)addObjects:(NSArray *)array;

@end

NS_ASSUME_NONNULL_END
