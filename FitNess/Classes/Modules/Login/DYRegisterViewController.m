//
//  DYRegisterViewController.m
//  FitNess
//
//  Created by 黄德玉 on 2017/7/4.
//  Copyright © 2017年 none. All rights reserved.
//

#import "DYRegisterViewController.h"
#import "DYRegisterView.h"

@interface DYRegisterViewController ()

@end

@implementation DYRegisterViewController

- (void)loadView{
    DYRegisterView * v = [[DYRegisterView alloc] init];
    self.view = v;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"注册";
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
