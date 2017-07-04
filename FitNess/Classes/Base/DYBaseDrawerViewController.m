//
//  DYBaseDrawerViewController.m
//  FitNess
//
//  Created by 黄德玉 on 2017/7/3.
//  Copyright © 2017年 none. All rights reserved.
//

#import "DYBaseDrawerViewController.h"
#import "UIViewController+transition.h"
#import "UIImage+DYUtils.h"


@interface _DYDrawerAnimator : YGAnimator

- (instancetype)initWithType:(NSInteger)type;

@end



@interface DYBaseDrawerViewController ()

@property (nonatomic,strong) YGTransition * transition;

@end

@implementation DYBaseDrawerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self _addtransition];
}

- (void)_addtransition{
    YGInteractor * toInteractor = [[YGInteractor alloc] initWithDirection:YGInteractorDirectionRight edgeSpacing:0 forView:self.view];
    toInteractor.canOverPercent = .3;
    toInteractor.speedControl = 1.3;
    __weak typeof(self) weakSelf = self;
    [self yg_addToInteractor:toInteractor action:^{
        UIViewController * toVC = [[NSClassFromString(@"DYDrawerViewController") alloc] init];
        UINavigationController * nav = [[UINavigationController alloc] initWithRootViewController:toVC];
        [weakSelf _transitionWithVC:nav];
    }];
}

- (void)_transitionWithVC:(UIViewController *)vc{
    YGTransition * transition = [[YGTransition alloc] init];
    _DYDrawerAnimator * toAnimator = [[_DYDrawerAnimator alloc] initWithType:0];
    transition.toAnimator = toAnimator;
    _DYDrawerAnimator * backAnimator = [[_DYDrawerAnimator alloc] initWithType:1];
    transition.backAnimator = backAnimator;
    [self yg_presentViewController:vc withTransition:transition];
}

@end


@interface _DYDrawerAnimator ()

@property (nonatomic,assign) CGFloat rightMargin;

@end

@implementation _DYDrawerAnimator

- (instancetype)initWithType:(NSInteger)type{
    if (self = [super init]) {
        self.timeInterval = .25;
        if (type == 0) {
            [self addToAnimator];
        }else{
            [self addBackAnimator];
        }
        _rightMargin = SCREEN_WIDTH - PixToPoint(350);
        ;    }
    return self;
}


- (void)addToAnimator{
    __weak typeof(self) weakSelf = self;
    self.animatorBlock = ^(id<UIViewControllerContextTransitioning> context) {
        UIViewController * fromVC = [context viewControllerForKey:UITransitionContextFromViewControllerKey];
        UIViewController * toVC = [context viewControllerForKey:UITransitionContextToViewControllerKey];
        UIView * containView = [context containerView];
        [containView addSubview:toVC.view];
        toVC.view.transform = CGAffineTransformMakeTranslation(-weakSelf.rightMargin, 0);
        UIImage * snapShot = [UIImage dy_captureWithView:fromVC.view];
        UIView * extraView = [[UIImageView alloc] initWithImage:snapShot];
        extraView.frame = CGRectMake(weakSelf.rightMargin, 0, snapShot.size.width, snapShot.size.height);
        [toVC.view addSubview:extraView];
        [UIView animateWithDuration:weakSelf.timeInterval animations:^{
            fromVC.view.transform = CGAffineTransformMakeTranslation(weakSelf.rightMargin, 0);
            toVC.view.transform = CGAffineTransformIdentity;
        } completion:^(BOOL finished) {
            [context completeTransition:![context transitionWasCancelled]];
        }];
    };
}

- (void)addBackAnimator{
    __weak typeof(self) weakSelf = self;
    self.animatorBlock = ^(id<UIViewControllerContextTransitioning> context) {
        UIViewController * fromVC = [context viewControllerForKey:UITransitionContextFromViewControllerKey];
        UIViewController * toVC = [context viewControllerForKey:UITransitionContextToViewControllerKey];
        UIView * containView = [context containerView];
        [containView addSubview:toVC.view];                             //对于fullscreenmodal转场来说，转场开始tovc.view会自动加入到containView中，对于Navigation转场来说，需要手动加入
        [UIView animateWithDuration:weakSelf.timeInterval animations:^{
            fromVC.view.transform = CGAffineTransformMakeTranslation(-weakSelf.rightMargin, 0);
            toVC.view.transform = CGAffineTransformIdentity;
        } completion:^(BOOL finished) {
            BOOL isCanceled = [context transitionWasCancelled];
            [context completeTransition:!isCanceled];
            if (isCanceled) {
                [toVC.view removeFromSuperview];
            }
        }];
    };
}

@end
