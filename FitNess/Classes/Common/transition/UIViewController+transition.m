//
//  UIViewController+transition.m
//  YGTranslation
//
//  Created by 黄德玉 on 2017/3/29.
//  Copyright © 2017年 黄德玉. All rights reserved.
//

#import "UIViewController+transition.h"
#import <objc/runtime.h>

const char * kTransitionKey;

const char * kToInteractorKey;

const char * kBackInteractorKey;

@implementation UIViewController (transition)

- (void)yg_presentViewController:(UIViewController *)vc withTransition:(YGTransition *)transition{
    // vc.modalPresentationStyle = UIModalPresentationCustom;
    vc.transitioningDelegate = transition;
    [self _yg_setTransitionWithVC:vc transition:transition];
    [self presentViewController:vc animated:YES completion:nil];
}

- (void)yg_presentCustomViewController:(UIViewController *)controller withTransition:(YGTransition *)transition{
    controller.modalPresentationStyle = UIModalPresentationCustom;
    [self yg_presentViewController:controller withTransition:transition];
}

- (void)yg_pushViewController:(UIViewController *)vc withTransition:(YGTransition *)transition{
    self.navigationController.delegate = transition;
    [self _yg_setTransitionWithVC:vc transition:transition];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)_yg_setTransitionWithVC:(UIViewController *)vc transition:(YGTransition *)transition{
    objc_setAssociatedObject(vc, &kTransitionKey, transition, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    YGInteractor * toInterActor = objc_getAssociatedObject(self, &kToInteractorKey);
    if (toInterActor) {
        [transition setValue:toInterActor forKey:@"toInteractor"];
    }
    YGInteractor * backInteractor = objc_getAssociatedObject(vc, &kBackInteractorKey);
    if (backInteractor) {
        [transition setValue:backInteractor forKey:@"backInteractor"];
    }
}

- (void)yg_addToInteractor:(YGInteractor *)interactor action:(void (^)())block {
    objc_setAssociatedObject(self, &kToInteractorKey, interactor, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    interactor.transitionAction = block;
}

- (void)yg_addBackInteractor:(YGInteractor *)interactor action:(void (^)())block{
    interactor.transitionAction = block;
    YGTransition * transition = objc_getAssociatedObject(self, &kTransitionKey);
    if (transition && [transition isKindOfClass:[YGTransition class]]) {
        [transition setValue:interactor forKey:@"backInteractor"];
        return;
    }
    objc_setAssociatedObject(self, &kBackInteractorKey, interactor, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
}






@end
