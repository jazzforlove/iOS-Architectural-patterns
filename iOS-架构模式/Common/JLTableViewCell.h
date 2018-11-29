//
//  JLTableViewCell.h
//  iOS-架构模式
//
//  Created by 李国卿 on 2018/11/28.
//  Copyright © 2018年 Jazzfly. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface JLTableViewCell : UITableViewCell

@property (nonatomic,strong) UILabel *nameLab;

@property (nonatomic,strong) UIButton *addBtn;

@property (nonatomic,strong) UILabel *numLab;

@property (nonatomic,strong) UIButton *subBtn;

@property (nonatomic,assign) NSInteger num;

@property (nonatomic,strong) NSIndexPath *indexpath;

@end

NS_ASSUME_NONNULL_END
