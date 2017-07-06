//
//  UIViewController+transition.h
//  YGTranslation
//
//  Created by 黄德玉 on 2017/3/29.
//  Copyright © 2017年 黄德玉. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YGTransition.h"

@interface UIViewController (transition)


- (void)yg_presentViewController:(UIViewController *)controller withTransition:(YGTransition *)transition;



- (void)yg_presentCustomViewController:(UIViewController *)controller withTransition:(YGTransition *)transition;


- (void)yg_addToInteractor:(YGInteractor *)interactor action:(void(^)())block;


- (void)yg_addBackInteractor:(YGInteractor *)interactor action:(void(^)())block;


- (void)yg_pushViewController:(UIViewController *)vc withTransition:(YGTransition *)trnasition;

@end
