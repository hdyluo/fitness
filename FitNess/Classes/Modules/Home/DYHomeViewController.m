//
//  DYHomeViewController.m
//  FitNess
//
//  Created by 黄德玉 on 2017/7/3.
//  Copyright © 2017年 none. All rights reserved.
//

#import "DYHomeViewController.h"
#import "DYHomeCell.h"
#import "DYLoginViewController.h"

@interface DYHomeViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) UITableView * tableView;

@end

@implementation DYHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"首页";
    [self.view addSubview:self.tableView];
    [self _addRightBtn];
}


- (void)_addRightBtn{
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"点击登录" style:UIBarButtonItemStylePlain target:self action:@selector(rightClicked)];
}

- (void)rightClicked{
    DYLoginViewController * loginVC = [[DYLoginViewController alloc] init];
    UINavigationController * nav = [[UINavigationController alloc] initWithRootViewController:loginVC];
//      [self.navigationController pushViewController:loginVC animated:YES];
    [self presentViewController:nav animated:YES completion:nil];
}


#pragma mark - tableView dataSource and delegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    DYHomeCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 200;
}



#pragma mark - 

- (UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.bounds];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [_tableView registerClass:[DYHomeCell class] forCellReuseIdentifier:@"cell"];
    }
    return _tableView;
}


@end
