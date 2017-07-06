//
//  YGInteractor.h
//  YGTranslation
//
//  Created by 黄德玉 on 2017/3/29.
//  Copyright © 2017年 黄德玉. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger,YGInteractorDirection) {
    YGInteractorDirectionLeft,
    YGInteractorDirectionRight,
    YGInteractorDirectionTop,
    YGInteractorDirectionBottom
};


@interface YGInteractor : UIPercentDrivenInteractiveTransition

@property (nonatomic,assign) BOOL canInteracive;

@property (nonatomic,assign) CGFloat speedControl;

@property (nonatomic,assign) CGFloat canOverPercent;           

@property (nonatomic,assign) NSInteger tag;


- (instancetype)initWithDirection:(YGInteractorDirection)direction edgeSpacing:(CGFloat)spacing forView:(UIView *)view ;

@property (nonatomic,copy) void (^transitionAction)();

@end
