//
//  DYLoginViewController.m
//  FitNess
//
//  Created by 黄德玉 on 2017/7/4.
//  Copyright © 2017年 none. All rights reserved.
//

#import "DYLoginViewController.h"
#import "DYLoginView.h"
#import "UINavigationController+FDFullscreenPopGesture.h"
#import "DYRegisterViewController.h"


@interface DYLoginViewController ()<DYLoginViewDelegate>



@end

@implementation DYLoginViewController

- (void)loadView{
    DYLoginView * loginView = [[DYLoginView alloc] init];
    loginView.delegate = self;
    self.view = loginView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.fd_prefersNavigationBarHidden = YES;
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
}


- (void)btnClickeWithTag:(NSInteger)tag{
    switch (tag) {
        case 10:
            break;
        case 11:{
            DYRegisterViewController * vc = [[DYRegisterViewController alloc] init];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        case 12:
            break;
        case 13:
            [self.navigationController dismissViewControllerAnimated:YES completion:nil];
            break;
        default:
            break;
    }
}

@end
