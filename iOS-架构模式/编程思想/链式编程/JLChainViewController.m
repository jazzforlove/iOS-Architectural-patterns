//
//  JLChainViewController.m
//  iOS-架构模式
//
//  Created by 李国卿 on 2018/12/7.
//  Copyright © 2018年 Jazzfly. All rights reserved.
//

#import "JLChainViewController.h"
#import "Person.h"
@interface JLChainViewController ()

//@property (nonatomic,strong) Person *person;

@end

@implementation JLChainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    /**
     链式编程思想:方法的返回值必须是方法的调用者
     */
    //1.普通方法
//    Person *person = [[Person alloc]init];
//    [person eat];
//    [person sleep];
    
    //2.链式编程
//    Person *person2 = [[Person alloc]init];
    //可按照顺序执行
//    [[person2 eat] sleep];
    //可点语法
//    person2.eat.sleep;
    
    //3.链式编程+block
    Person *person3 = [[Person alloc]init];
    person3.eat(@"香蕉").sleep(@"床");
}



@end
