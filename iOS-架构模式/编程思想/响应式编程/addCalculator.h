//
//  addCalculator.h
//  iOS-架构模式
//
//  Created by 李国卿 on 2018/12/7.
//  Copyright © 2018年 Jazzfly. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
// 链式
@interface addCalculator : NSObject

@property (nonatomic, assign) NSInteger sumresult;

- (addCalculator *(^)(NSInteger result))add;

@end

NS_ASSUME_NONNULL_END
