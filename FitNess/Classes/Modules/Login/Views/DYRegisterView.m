//
//  DYRegisterView.m
//  FitNess
//
//  Created by 黄德玉 on 2017/7/4.
//  Copyright © 2017年 none. All rights reserved.
//

#import "DYRegisterView.h"
#import "UIImage+DYUtils.h"
#import "UIView+DYCustomBorder.h"
#import "UIButton+DYCountDown.h"

@interface DYRegisterView ()

@property (nonatomic,strong) UITextField * userNameTextField;
@property (nonatomic,strong) UITextField * codeTextField;
@property (nonatomic,strong) UIButton * sendMsgBtn;
@property (nonatomic,strong) UIButton * nextStepBtn;
@property (nonatomic,strong) UILabel * licenseLabel;

@end

@implementation DYRegisterView

- (instancetype)init{
    if (self = [super init]) {
        [self addSubview:self.userNameTextField];
        [self addSubview:self.codeTextField];
        [self addSubview:self.sendMsgBtn];
        [self addSubview:self.nextStepBtn];
        [self addSubview:self.licenseLabel];
        [self _layout];
    }
    return self;
}

- (void)_layout{
    [self.userNameTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(20);
        make.top.equalTo(self).offset(NAVIGATION_HEIGHT + 10);
        make.right.equalTo(self).offset(-20);
        make.height.equalTo(@40);
    }];
    
    [self.codeTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(20);
        make.right.equalTo(self).offset(-20);
        make.top.equalTo(self.userNameTextField.mas_bottom);
        make.height.equalTo(@50);
    }];
    [self.sendMsgBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.codeTextField).offset(10);
        make.bottom.equalTo(self.codeTextField).offset(-10);
        make.width.equalTo(@80);
        make.right.equalTo(self).offset(-20);
    }];
    [self.nextStepBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.codeTextField.mas_bottom).offset(10);
        make.left.equalTo(self).offset(40);
        make.right.equalTo(self).offset(-40);
        make.height.equalTo(@40);
    }];
    [self.licenseLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(30);
        make.right.equalTo(self).offset(-30);
        make.top.equalTo(self.nextStepBtn.mas_bottom).offset(20);
    }];
    [self.userNameTextField dy_addBottomBorderWithColor:[UIColor lightGrayColor] width:onePix];
    [self.codeTextField dy_addBottomBorderWithColor:[UIColor lightGrayColor] width:onePix];
}

#pragma mark - action

- (void)btnClicked:(UIButton *)btn{
    if (btn.tag == 11) {
        btn.userInteractionEnabled = NO;
//        [btn dy_startTime:60 title:@"倒计时" waitTittle:@""];
        [btn dy_addCountDown:60 withTitle:@"倒计时" completionBlock:^{
            
        }];
    }
}

- (void)tapOn:(UIGestureRecognizer * )gesture{
    
}


#pragma mark - 

- (UITextField *)userNameTextField{
    if (!_userNameTextField) {
        _userNameTextField = [[UITextField alloc] init];
        _userNameTextField.leftView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 40, 40)];
        _userNameTextField.placeholder = @"请输入手机号";
        _userNameTextField.tag = 100;
        _userNameTextField.keyboardType = UIKeyboardTypeNumberPad;
        _userNameTextField.font = [UIFont systemFontOfSize:15];
    }
    return _userNameTextField;
}

- (UITextField *)codeTextField{
    if (!_codeTextField) {
        _codeTextField = [[UITextField alloc] init];
        _codeTextField.leftView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 40, 40)];
        _codeTextField.placeholder = @"请输入验证码";
        _codeTextField.tag = 101;
        _codeTextField.keyboardType  = UIKeyboardTypeNumberPad;
        _codeTextField.font = [UIFont systemFontOfSize:15];
    }
    return _codeTextField;
}

- (UIButton *)sendMsgBtn{
    if (!_sendMsgBtn) {
        _sendMsgBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_sendMsgBtn setTitle:@"发送验证码" forState:UIControlStateNormal];
        _sendMsgBtn.layer.borderColor = [UIColor lightGrayColor].CGColor;
        _sendMsgBtn.layer.cornerRadius = 5.0;
        _sendMsgBtn.layer.masksToBounds = YES;
        _sendMsgBtn.layer.borderWidth = onePix;
        [_sendMsgBtn setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
        [_sendMsgBtn addTarget:self action:@selector(btnClicked:) forControlEvents:UIControlEventTouchUpInside];
        _sendMsgBtn.titleLabel.font = [UIFont systemFontOfSize:14];
        _sendMsgBtn.tag = 11;
    }
    return _sendMsgBtn;
}

- (UIButton *)nextStepBtn{
    if (!_nextStepBtn) {
        _nextStepBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_nextStepBtn setBackgroundImage:[UIImage dy_imageWithColor:DEFAULT_COLOR] forState:UIControlStateNormal];
        _nextStepBtn.layer.cornerRadius = 5.0;
        _nextStepBtn.layer.masksToBounds = YES;
        [_nextStepBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_nextStepBtn addTarget:self action:@selector(btnClicked:) forControlEvents:UIControlEventTouchUpInside];
        [_nextStepBtn setTitle:@"下一步" forState:UIControlStateNormal];
        _nextStepBtn.tag = 10;
    }
    return _nextStepBtn;
}

- (UILabel *)licenseLabel{
    if (!_licenseLabel) {
        _licenseLabel = [[UILabel alloc] init];
        [_licenseLabel setFont:[UIFont systemFontOfSize:14]];
        _licenseLabel.numberOfLines = 2;
        
        NSMutableAttributedString *attString = [[NSMutableAttributedString alloc] initWithString:@"轻触上面的“登录或注册”按钮，即表示您同意《软件许可及服务协议》"];
        [attString setAttributes:@{NSForegroundColorAttributeName:DEFAULT_COLOR,NSUnderlineStyleAttributeName:[NSNumber numberWithLong:NSUnderlineStyleSingle] } range:NSMakeRange(21, attString.length - 21)];
        
        _licenseLabel.attributedText = attString;
        UITapGestureRecognizer * tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapOn:)];
        _licenseLabel.userInteractionEnabled = YES;
        [_licenseLabel addGestureRecognizer:tapGesture];
    }
    return _licenseLabel;
}


@end
