//
//  JLContentViewCell.m
//  iOS-架构模式
//
//  Created by 李国卿 on 2018/12/4.
//  Copyright © 2018年 Jazzfly. All rights reserved.
//

#import "JLContentViewCell.h"

@interface JLContentViewCell ()

@property (nonatomic,strong) UIButton *lastBtn;

@end

@implementation JLContentViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setupSubViews];
    }
    return self;
}
- (void)setupSubViews{
    //主题
    [self.contentView addSubview:self.mainLab];
    [self.mainLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(15);
        make.top.mas_equalTo(20);
        make.right.mas_equalTo(-15);
        make.height.mas_lessThanOrEqualTo(80);
    }];
    self.mainLab.preferredMaxLayoutWidth = kScreenWidth - 30;
    // 描述
    [self.contentView addSubview:self.descLab];
    [self.descLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(15);
        make.right.mas_equalTo(-15);
        make.top.mas_equalTo(self.mainLab.mas_bottom).offset(15);
    }];
        self.descLab.preferredMaxLayoutWidth = kScreenWidth - 30;
    [self.contentView addSubview:self.lastBtn];
    // 按钮
    [self.lastBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(15);
        make.right.mas_equalTo(-15);
        make.top.mas_equalTo(self.descLab.mas_bottom).offset(15);
        make.height.mas_equalTo(45);
    }];
    //距离底部的距离
    self.hyb_bottomOffsetToCell = 20;
}

- (UILabel *)mainLab{
    if (!_mainLab) {
        _mainLab = [[UILabel alloc]init];
        _mainLab.numberOfLines = 0;
    }
    return _mainLab;
}

- (UILabel *)descLab{
    if (!_descLab) {
        _descLab = [[UILabel alloc]init];
        _descLab.numberOfLines = 0;
    }
    return _descLab;
}
- (UIButton *)lastBtn{
    if (!_lastBtn) {
        _lastBtn = [[UIButton alloc]init];
        [_lastBtn setTitle:@"最后一个cell" forState:UIControlStateNormal];
        [_lastBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        _lastBtn.backgroundColor = [UIColor cyanColor];
    }
    return _lastBtn;
}


@end
