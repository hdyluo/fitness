//
//  AppDelegate+DYUI.m
//  FitNess
//
//  Created by 黄德玉 on 2017/7/3.
//  Copyright © 2017年 none. All rights reserved.
//

#import "AppDelegate+DYUI.h"
#import "DYHomeViewController.h"

@implementation AppDelegate (DYUI)


- (void)setupUI{
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen]
                   .bounds];
    [self.window makeKeyAndVisible];
    [self toMain];
}

- (void)toMain{
    DYHomeViewController * vc = [[DYHomeViewController alloc] init];
    DYHomeViewController *vc1 = [[DYHomeViewController alloc] init];
    UITabBarController * tabBarController = [[UITabBarController alloc] init];
    [self _addItemController:vc toTabBarController:tabBarController];
    [self _addItemController:vc1 toTabBarController:tabBarController];
    self.window.rootViewController = tabBarController;
}

- (void)toAd{
    
}

- (void)toFirstLaunch{
    
}




#pragma mark - private methods
- (void)_addLaunchOverAnimator{
    
}
- (void)_addItemController:(UIViewController *)itemController toTabBarController:(UITabBarController *)tab {
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:itemController];
    nav.view.backgroundColor = [UIColor clearColor];
//    tab.tabBar.tintColor = COLOR_NAV_RED;
    tab.tabBar.backgroundColor = HexRGB(0xf9f9f9);
    [tab addChildViewController:nav];
}


-(void)_setupAppearance{
    
//    [[UINavigationBar appearance] setBackgroundImage:[UIImage imageWithColor:[[UIColor redColor] colorWithAlphaComponent:0.99]] forBarMetrics:UIBarMetricsDefault];//如果颜色指定为不透明，则viewController 的坐标是从0,64 开始的，如果有一点透明，则是从0，0开始计算的。
//    [[UINavigationBar appearance] setTintColor:[UIColor whiteColor]];
//    [[UINavigationBar appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
//                                                          [UIColor whiteColor], NSForegroundColorAttributeName, [UIFont boldSystemFontOfSize:17], NSFontAttributeName, nil]];
}

@end
