//
//  Person.h
//  iOS-架构模式
//
//  Created by 李国卿 on 2018/12/7.
//  Copyright © 2018年 Jazzfly. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Person : NSObject

// 普通方法
//- (void)eat;
//- (void)sleep;

//链式
//- (Person *)eat;
//- (Person *)sleep;

//链式+block
- (Person *(^_Nonnull)(NSString *food))eat;
- (Person *(^_Nonnull)(NSString *where))sleep;

@end

NS_ASSUME_NONNULL_END
