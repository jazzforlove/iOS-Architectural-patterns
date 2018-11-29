//
//  MVCManager.h
//  iOS-架构模式
//
//  Created by 李国卿 on 2018/11/29.
//  Copyright © 2018年 Jazzfly. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JLModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface MVCManager : NSObject

+ (instancetype)shareManager;

@property (nonatomic,strong) NSMutableArray *dataArray;

@end

NS_ASSUME_NONNULL_END
