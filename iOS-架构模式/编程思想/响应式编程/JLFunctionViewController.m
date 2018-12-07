//
//  JLFunctionViewController.m
//  iOS-架构模式
//
//  Created by 李国卿 on 2018/12/7.
//  Copyright © 2018年 Jazzfly. All rights reserved.
//

#import "JLFunctionViewController.h"
#import "Person.h"
@interface JLFunctionViewController ()

@end

@implementation JLFunctionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
   Person *person = [[Person alloc]init];
//   Person *calcuteP = [person calculate:^NSInteger(NSInteger result) {
//        result = result +10;
//        result = result*10;
//        return result;
//    }];
//    NSLog(@"%p,%p,%ld",person,calcuteP,(long)calcuteP.result);
    [person makeCalculate:^(addCalculator * _Nonnull calculator) {
        calculator.add(10).add(30);
    }];
    
    NSLog(@"%ld", (long)person.result);
}



@end
