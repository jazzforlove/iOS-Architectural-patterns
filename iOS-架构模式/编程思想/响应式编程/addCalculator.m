//
//  addCalculator.m
//  iOS-架构模式
//
//  Created by 李国卿 on 2018/12/7.
//  Copyright © 2018年 Jazzfly. All rights reserved.
//

#import "addCalculator.h"

@implementation addCalculator

- (addCalculator *(^)(NSInteger sumresult))add{
    // 返回参数 返回对象
    return ^(NSInteger sumresult){
        self->_sumresult += sumresult;
        return self;
    };
}

@end
