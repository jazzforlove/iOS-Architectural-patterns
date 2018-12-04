//
//  JLTableViewModel.m
//  iOS-架构模式
//
//  Created by 李国卿 on 2018/12/4.
//  Copyright © 2018年 Jazzfly. All rights reserved.
//

#import "JLTableViewModel.h"
#import "JLTableModel.h"

@implementation JLTableViewModel

- (instancetype)init{
    self = [super init];
    if (self) {
        [self loadData];
    }
    return self;
}

- (void)loadData{
    dispatch_queue_t q = dispatch_queue_create("com.concurrent", DISPATCH_QUEUE_CONCURRENT);
    dispatch_async(q, ^{
        int titleTotalLength = (int)[[self titleAll] length];
        int descTotalLength = (int)[[self descAll] length];
        for (NSUInteger i = 0; i < 5; ++i) {
            int titleLength = rand() % titleTotalLength + 15;
            if (titleLength > titleTotalLength - 1) {
                titleLength = titleTotalLength;
            }
            JLTableModel *model = [[JLTableModel alloc] init];
            model.title = [[self titleAll] substringToIndex:titleLength];
            model.uid = (int)i + 1;
            model.isExpand = NO;
            
            int descLength = rand() % descTotalLength + 20;
            if (descLength >= descTotalLength) {
                descLength = descTotalLength;
            }
            model.desc = [[self descAll] substringToIndex:descLength];
            
            [self.dataArray addObject:model];
        }
        dispatch_async(dispatch_get_main_queue(), ^{
            if (self.successBlock) {
                self.successBlock(self.dataArray);
            }
        });
    });

    
    
}

- (NSString *)titleAll {
    return @"欢迎使用HYBMasonryAutoCellHeight扩展，由作者huangyibiao提供，如有任何疑问，请给作者发email：huangyibiao520@163.com，谢谢您的支持！！！";
}

- (NSString *)descAll {
    return @"HYBMasonryAutoCellHeight是基于Masonry第三方开源库而实现的，如想更深入了解Masonry，可直接到github上的官方文档阅读，或可以到作者的博客中阅读相关文章：http://www.hybblog.com/masonryjie-shao/，如果阅读时有疑问，可直接联系作者（email或者QQ），最直接的方式就是在文章后面留言，作者会在收到反馈后的第一时间迅速查看，并给予相应的回复。欢迎留言，希望我们能成为朋友。";
}



- (NSMutableArray *)dataArray{
    if (!_dataArray) {
        _dataArray = [NSMutableArray array];
    }
    return _dataArray;
}

@end
