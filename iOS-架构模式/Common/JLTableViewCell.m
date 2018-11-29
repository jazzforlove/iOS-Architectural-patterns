//
//  JLTableViewCell.m
//  iOS-架构模式
//
//  Created by 李国卿 on 2018/11/28.
//  Copyright © 2018年 Jazzfly. All rights reserved.
//

#import "JLTableViewCell.h"

@implementation JLTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setupUI];
    }
    return self;
}
- (void)setupUI{
    self.contentView.backgroundColor = [UIColor whiteColor];
    [self.contentView addSubview:self.nameLab];
    [self.contentView addSubview:self.addBtn];
    [self.contentView addSubview:self.numLab];
    [self.contentView addSubview:self.subBtn];
    self.num = 0;
}
- (void)layoutSubviews{
    [super layoutSubviews];
    [self.nameLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.contentView);
        make.left.mas_equalTo(20);
    }];
    [self.addBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.contentView);
        make.right.mas_equalTo(-50);
        make.size.mas_equalTo(CGSizeMake(30, 30));
    }];
    [self.numLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.contentView);
        make.right.equalTo(self.addBtn.mas_left);
        make.size.mas_equalTo(CGSizeMake(50, 30));
    }];
    [self.subBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.contentView);
        make.right.equalTo(self.numLab.mas_left);
        make.size.equalTo(self.addBtn);
    }];
}

- (UILabel *)nameLab{
    if (!_nameLab) {
        _nameLab = [[UILabel alloc]init];
        _nameLab.textColor = [UIColor cyanColor];
        _nameLab.font = [UIFont systemFontOfSize:20];
        _nameLab.textAlignment = NSTextAlignmentCenter;
    }
    return _nameLab;
}

- (UIButton *)addBtn{
    if (!_addBtn) {
        _addBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_addBtn setTitle:@" + " forState:UIControlStateNormal];
        [_addBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        _addBtn.backgroundColor = [UIColor cyanColor];
        _addBtn.titleLabel.font = [UIFont systemFontOfSize:20];
        [_addBtn addTarget:self action:@selector(addBtnDidClick) forControlEvents:UIControlEventTouchUpInside];
        _addBtn.layer.cornerRadius = 15;
        _addBtn.layer.masksToBounds = YES;
        _addBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
    }
    return _addBtn;
}

- (UILabel *)numLab{
    if (!_numLab) {
        _numLab = [[UILabel alloc]init];
        _numLab.text = @"0";
        _numLab.textAlignment = NSTextAlignmentCenter;
        _numLab.font = [UIFont systemFontOfSize:20];
        _numLab.textColor = [UIColor redColor];
    }
    return _numLab;
}
- (UIButton *)subBtn{
    if (!_subBtn) {
        _subBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_subBtn setTitle:@" - " forState:UIControlStateNormal];
        [_subBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        _subBtn.titleLabel.font = [UIFont systemFontOfSize:20];
        _subBtn.backgroundColor = [UIColor cyanColor];
        [_subBtn addTarget:self action:@selector(subBtnDidClick) forControlEvents:UIControlEventTouchUpInside];
        _subBtn.layer.cornerRadius = 15;
        _subBtn.layer.masksToBounds = YES;
        _subBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
    }
    return _subBtn;
}

#pragma mark -- action

- (void)addBtnDidClick{
    if ([self.numLab.text integerValue] >=200) return;
    self.num ++;
    if (self.delegate && [self.delegate respondsToSelector:@selector(didClickAddBtnWithNum:indexPath:)]) {
        [self.delegate didClickAddBtnWithNum:[NSString stringWithFormat:@"%ld",(long)_num] indexPath:self.indexpath];
    }
}

- (void)subBtnDidClick{
    if ([self.numLab.text integerValue] <=0) return;
    self.num --;
    if (self.delegate && [self.delegate respondsToSelector:@selector(didClickAddBtnWithNum:indexPath:)]) {
        [self.delegate didClickAddBtnWithNum:[NSString stringWithFormat:@"%ld",(long)_num] indexPath:self.indexpath];
    }
}

- (void)setNum:(NSInteger)num{
    _num = num;
    self.numLab.text = [NSString stringWithFormat:@"%ld",(long)_num];
}






@end
