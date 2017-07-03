//
//  DYDrawerHeaderView.m
//  FitNess
//
//  Created by 黄德玉 on 2017/7/3.
//  Copyright © 2017年 none. All rights reserved.
//

#import "DYDrawerHeaderView.h"

@interface DYDrawerHeaderView ()

@property (nonatomic,strong) UILabel * titleLabel;

@end

@implementation DYDrawerHeaderView

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self addSubview:self.titleLabel];
        [self _layout];
    }
    return self;
}


#pragma mark - private methods

- (void)_layout{
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self);
        make.left.equalTo(self).offset(10);
        make.right.equalTo(self).offset(-10);
    }];
}

#pragma mark - 初始化

- (UILabel *)titleLabel{
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.textColor = [UIColor whiteColor];
        _titleLabel.text = @"Welcome To China";
    }
    return _titleLabel;
}

@end
