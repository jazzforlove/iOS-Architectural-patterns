//
//  Present.h
//  iOS-架构模式
//
//  Created by 李国卿 on 2018/11/28.
//  Copyright © 2018年 Jazzfly. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PresentDalegate.h"

NS_ASSUME_NONNULL_BEGIN

@interface Present : NSObject<PresentDelegate>

@property (nonatomic,strong) NSMutableArray *dataArray;

@property (nonatomic,weak) id<PresentDelegate> delegate;

- (void)addDataArray:(NSArray *)array;

-(NSInteger)total;

@end

NS_ASSUME_NONNULL_END
