//
//  ViewController.m
//  iOS-架构模式
//
//  Created by 李国卿 on 2018/11/28.
//  Copyright © 2018年 Jazzfly. All rights reserved.
//

#import "ViewController.h"
#import "MVCViewController.h"
#import "MVPViewController.h"
#import "MVVMViewController.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
}

- (IBAction)btnDidClick:(UIButton *)sender {
    switch (sender.tag) {
        case 100:{
            [self.navigationController pushViewController:[MVCViewController new] animated:YES];
            break;
        }
        case 101:{
            [self.navigationController pushViewController:[MVPViewController new] animated:YES];
            break;
        }
        case 102:{
            [self.navigationController pushViewController:[MVVMViewController new] animated:YES];
            break;
        }
            
        default:
            break;
    }
}



@end
