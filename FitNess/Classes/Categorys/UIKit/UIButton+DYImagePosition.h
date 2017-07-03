//
//  UIButton+DYImagePosition.h
//  FitNess
//
//  Created by 黄德玉 on 2017/7/3.
//  Copyright © 2017年 none. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger,DYImagePosition) {
    DYImagePositionLeft = 0,
    DYImagePositionTop,
    DYImagePositionBottom,
    DYImagePositionRight
};

@interface UIButton (DYImagePosition)

- (void)dy_setImagePosition:(DYImagePosition)postion spacing:(CGFloat)spacing;

@end
