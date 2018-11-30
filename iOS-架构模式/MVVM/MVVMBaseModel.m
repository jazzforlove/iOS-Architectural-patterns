//
//  MVVMBaseModel.m
//  iOS-架构模式
//
//  Created by 李国卿 on 2018/11/30.
//  Copyright © 2018年 Jazzfly. All rights reserved.
//

#import "MVVMBaseModel.h"

@implementation MVVMBaseModel

- (void)initWithSuccess:(SuccessBlock)successBlock andFailureBlock:(FailureBlock)failureBlock{
    _successBlock = successBlock;
    _failureBlock = failureBlock;
}
@end
