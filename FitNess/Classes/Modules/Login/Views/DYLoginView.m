//
//  DYLoginView.m
//  FitNess
//
//  Created by 黄德玉 on 2017/7/4.
//  Copyright © 2017年 none. All rights reserved.
//

#import "DYLoginView.h"
#import "UIButton+DYBlock.h"
#import "UIButton+DYCountDown.h"
#import "UIImage+DYUtils.h"
#import "UIView+DYCustomBorder.h"

@interface DYLoginView ()

@property (nonatomic,strong) UIButton * avatarBtn;
@property (nonatomic,strong) UIButton * loginBtn;
@property (nonatomic,strong) UIButton * registerBtn;
@property (nonatomic,strong) UIButton * forgetBtn;
@property (nonatomic,strong) UITextField * userNameTextField;
@property (nonatomic,strong) UITextField * pwdTextField;
@property (nonatomic,strong) UIButton * closeBtn;

@end

@implementation DYLoginView

- (instancetype)init{
    if (self = [super init]) {
        [self addSubview:self.avatarBtn];
        [self addSubview:self.loginBtn];
        [self addSubview:self.registerBtn];
        [self addSubview:self.forgetBtn];
        [self addSubview:self.userNameTextField];
        [self addSubview:self.pwdTextField];
        [self addSubview:self.closeBtn];
        [self _layout];
    }
    return self;
}

- (void)_layout{
    [self.avatarBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self);
        make.top.equalTo(self).offset(20);
        make.height.equalTo(@(200));
    }];
    [self.userNameTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.avatarBtn.mas_bottom);
        make.left.equalTo(self).offset(20);
        make.right.equalTo(self).offset(-20);
        make.height.equalTo(@40);
    }];
    [self.pwdTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(20);
        make.right.equalTo(self).offset(-20);
        make.top.equalTo(self.userNameTextField.mas_bottom).offset(10);
        make.height.equalTo(@40);
    }];
    [self.registerBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(20);
        make.top.equalTo(self.pwdTextField.mas_bottom).offset(10);
    }];
    [self.forgetBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.pwdTextField.mas_bottom).offset(10);
        make.right.equalTo(self).offset(-20);
    }];
    [self.loginBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(40);
        make.right.equalTo(self).offset(-40);
        make.top.equalTo(self.forgetBtn.mas_bottom).offset(10);
        make.height.equalTo(@40);
    }];
    [self.closeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.equalTo(self);
        make.width.equalTo(@60);
        make.height.equalTo(@80);
    }];
    [self.userNameTextField dy_addBottomBorderWithColor:[UIColor lightGrayColor] width:onePix];
    [self.pwdTextField dy_addBottomBorderWithColor:[UIColor lightGrayColor] width:onePix];
}



#pragma mark - action

- (void)btnClicked:(UIButton *)btn{
    if ([self.delegate respondsToSelector:@selector(btnClickeWithTag:)]) {
        [self.delegate btnClickeWithTag:btn.tag];
    }
    DLog(@"当前按钮的tag是%ld",btn.tag);
}

#pragma mark -

- (UIButton *)avatarBtn{
    if (!_avatarBtn) {
        _avatarBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_avatarBtn setImage:[UIImage imageNamed:@"setting_avator"] forState:UIControlStateNormal];
        _avatarBtn.userInteractionEnabled = NO;
    }
    return _avatarBtn;
}

- (UIButton *)loginBtn{
    if (!_loginBtn) {
        _loginBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_loginBtn setBackgroundImage:[UIImage dy_imageWithColor:DEFAULT_COLOR] forState:UIControlStateNormal];
        _loginBtn.layer.cornerRadius = 5.0;
        _loginBtn.layer.masksToBounds = YES;
        [_loginBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_loginBtn addTarget:self action:@selector(btnClicked:) forControlEvents:UIControlEventTouchUpInside];
        [_loginBtn setTitle:@"登录" forState:UIControlStateNormal];
        _loginBtn.tag = 10;
    }
    return _loginBtn;
}

- (UIButton *)registerBtn{
    if (!_registerBtn) {
        _registerBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_registerBtn setTitle:@"立即注册" forState:UIControlStateNormal];
        [_registerBtn setTitleColor:DEFAULT_COLOR forState:UIControlStateNormal];
        [_registerBtn addTarget:self action:@selector(btnClicked:) forControlEvents:UIControlEventTouchUpInside];
        _registerBtn.titleLabel.font = [UIFont systemFontOfSize:14];
        _registerBtn.tag = 11;
    }
    return _registerBtn;
}

- (UIButton *)forgetBtn{
    if (!_forgetBtn) {
        _forgetBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_forgetBtn setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
        [_forgetBtn setTitle:@"忘记密码" forState:UIControlStateNormal];
        _forgetBtn.titleLabel.font = [UIFont systemFontOfSize:14];
        [_forgetBtn addTarget:self action:@selector(btnClicked:) forControlEvents:UIControlEventTouchUpInside];
        _forgetBtn.tag = 12;
    }
    return _forgetBtn;
}

- (UITextField *)userNameTextField{
    if (!_userNameTextField) {
        _userNameTextField = [[UITextField alloc] init];
        _userNameTextField.leftView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 40, 40)];
        _userNameTextField.placeholder = @"请输入用户名";
        _userNameTextField.tag = 100;
        _userNameTextField.font = [UIFont systemFontOfSize:15];
    }
    return _userNameTextField;
}

- (UITextField *)pwdTextField{
    if (!_pwdTextField) {
        _pwdTextField = [[UITextField alloc] init];
        _pwdTextField.leftView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 40, 40)];
        _pwdTextField.placeholder = @"请输入密码";
        _pwdTextField.secureTextEntry = YES;
        _pwdTextField.tag = 101;
        _pwdTextField.font = [UIFont systemFontOfSize:15];
    }
    return _pwdTextField;
}

- (UIButton *)closeBtn{
    if (!_closeBtn) {
        _closeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_closeBtn setImage:[UIImage imageNamed:@"setting_close"] forState:UIControlStateNormal];
        [_closeBtn addTarget:self action:@selector(btnClicked:) forControlEvents:UIControlEventTouchUpInside];
        _closeBtn.tag = 13;
    }
    return _closeBtn;
}


@end
