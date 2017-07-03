//
//  DYDrawerViewController.m
//  FitNess
//
//  Created by 黄德玉 on 2017/7/3.
//  Copyright © 2017年 none. All rights reserved.
//

#import "DYDrawerViewController.h"
#import "UIViewController+transition.h"
#import "UINavigationController+FDFullscreenPopGesture.h"
#import "DYDrawerCell.h"
#import "DYDrawerHeaderView.h"

@interface DYDrawerViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) UITableView * tableView;

@end

@implementation DYDrawerViewController

- (instancetype)init{
    if (self = [super init]) {
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = RGBCOLOR(14, 15, 17);
    self.fd_prefersNavigationBarHidden = YES;
    [self _addBackInteractor];
    [self.view addSubview:self.tableView];
}

- (void)_addBackInteractor{
    YGInteractor * interactor = [[YGInteractor alloc] initWithDirection:YGInteractorDirectionLeft edgeSpacing:0 forView:self.view];
    interactor.canOverPercent = .2;
    __weak typeof(self) weakSelf = self;
    [self.navigationController yg_addBackInteractor:interactor action:^{
        [weakSelf.navigationController dismissViewControllerAnimated:YES completion:nil];
    }];
}

#pragma mark - tableView delegate and dataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 3;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 50;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    DYDrawerCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    DYBaseViewController * testVC = [[DYBaseViewController alloc] init];
    [self.navigationController pushViewController:testVC animated:YES];
}


#pragma mark - 初始化

- (UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.bounds];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.tableFooterView = [UIView new];
        UIView * backGroundView = [UIView new];
        backGroundView.backgroundColor = [UIColor blackColor];
        _tableView.backgroundView = backGroundView; 
        [_tableView registerClass:[DYDrawerCell class] forCellReuseIdentifier:@"cell"];
        DYDrawerHeaderView * headerView = [[DYDrawerHeaderView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 200)];
        _tableView.tableHeaderView = headerView;
    }
    return _tableView;
}



@end
