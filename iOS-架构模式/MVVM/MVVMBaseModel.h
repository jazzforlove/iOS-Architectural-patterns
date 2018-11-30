//
//  MVVMBaseModel.h
//  iOS-架构模式
//
//  Created by 李国卿 on 2018/11/30.
//  Copyright © 2018年 Jazzfly. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^SuccessBlock)(id data);
typedef void(^FailureBlock)(id data);

NS_ASSUME_NONNULL_BEGIN

@interface MVVMBaseModel : NSObject

@property (nonatomic, copy) SuccessBlock successBlock;
@property (nonatomic, copy) FailureBlock failureBlock;

- (void)initWithSuccess:(SuccessBlock)successBlock andFailureBlock:(FailureBlock)failureBlock;

@end

NS_ASSUME_NONNULL_END
