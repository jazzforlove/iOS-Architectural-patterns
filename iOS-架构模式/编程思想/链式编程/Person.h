//
//  Person.h
//  iOS-架构模式
//
//  Created by 李国卿 on 2018/12/7.
//  Copyright © 2018年 Jazzfly. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "addCalculator.h"
NS_ASSUME_NONNULL_BEGIN

@interface Person : NSObject

@property (nonatomic, assign) NSInteger result;
// 普通方法
//- (void)eat;
//- (void)sleep;

//链式
//- (Person *)eat;
//- (Person *)sleep;

//链式+block
- (Person *(^_Nonnull)(NSString *food))eat;
- (Person *(^_Nonnull)(NSString *where))sleep;

// 函数式+block
- (Person *)calculate:(NSInteger (^)(NSInteger result))block;
- (Person *)makeCalculate:(void (^)(addCalculator *calculator))block;

@end

NS_ASSUME_NONNULL_END
