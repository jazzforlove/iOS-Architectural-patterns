//
//  Person.m
//  iOS-架构模式
//
//  Created by 李国卿 on 2018/12/7.
//  Copyright © 2018年 Jazzfly. All rights reserved.
//

#import "Person.h"

@implementation Person

//- (void)eat{
//    NSLog(@"%@",__func__);
//}
//- (void)sleep{
//    NSLog(@"%@",__func__);
//}

//- (Person *)eat{
//     NSLog(@"%@",__func__);
//    return self
//}
//- (Person *)sleep{
//     NSLog(@"%@",__func__);
//    return self;
//}

- (Person *(^_Nonnull)(NSString *food))eat{
    return ^(NSString  * _Nonnull food){
        NSLog(@"吃:%@",food);
        return self;
    };
}

- (Person *(^_Nonnull)(NSString *where))sleep{
    return ^(NSString  * _Nonnull where){
        NSLog(@"睡:%@",where);
        return self;
    };
}

- (Person *)calculate:(NSInteger (^)(NSInteger result))block{
    _result = block(_result);
    return self;
}

- (Person *)makeCalculate:(void (^)(addCalculator *calculator))block{
    addCalculator *add = [[addCalculator alloc]init];
    if (block) {
        block(add);
    }
    self.result = add.sumresult;
    return self;
}
@end
