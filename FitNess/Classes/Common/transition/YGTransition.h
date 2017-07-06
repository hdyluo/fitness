//
//  YGTransition.h
//  YGTranslation
//
//  Created by 黄德玉 on 2017/3/29.
//  Copyright © 2017年 黄德玉. All rights reserved.





#import <UIKit/UIKit.h>
#import "YGAnimator.h"
#import "YGInteractor.h"

typedef NS_ENUM(NSInteger,YGTransitionType) {
    YGTransitionTypePush = 0,
    YGTransitionTypePop,
    YGTransitionTypePresent,
    YGTransitionTypeDismiss
};


@interface YGTransition : NSObject<UIViewControllerTransitioningDelegate,UINavigationControllerDelegate>

@property (nonatomic, strong) YGAnimator * toAnimator;

@property (nonatomic, strong) YGAnimator * backAnimator;



@end
