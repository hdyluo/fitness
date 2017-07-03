//
//  DYDrawerCell.m
//  FitNess
//
//  Created by 黄德玉 on 2017/7/3.
//  Copyright © 2017年 none. All rights reserved.
//

#import "DYDrawerCell.h"

@interface DYDrawerCell ()

@property (nonatomic,strong) UIButton * imgBtn;
@property (nonatomic,strong) UILabel * titleLbl;


@end

@implementation DYDrawerCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self.contentView addSubview:self.imgBtn];
        [self.contentView addSubview:self.titleLbl];
        self.contentView.backgroundColor = [UIColor blackColor];
        [self _layout];
    }
    return self;
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

#pragma mark - private methods

- (void)_layout{
    [self.imgBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.contentView);
        make.width.equalTo(@40);
        make.height.equalTo(@40);
        make.left.equalTo(self).offset(10);
    }];
    
    [self.titleLbl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.contentView);
        make.left.equalTo(self.imgBtn.mas_right).offset(10);
        make.right.equalTo(self.contentView).offset(-10);
    }];
}

#pragma mark - 初始化

- (UIButton *)imgBtn{
    if (!_imgBtn) {
        _imgBtn = [UIButton buttonWithType:UIButtonTypeSystem];
        _imgBtn.backgroundColor = [UIColor brownColor];
    }
    return _imgBtn;
}

- (UILabel *)titleLbl{
    if (!_titleLbl) {
        _titleLbl = [[UILabel alloc] init];
        _titleLbl.textColor = [UIColor whiteColor];
        _titleLbl.text = @"Message";
    }
    return _titleLbl;
}

@end
