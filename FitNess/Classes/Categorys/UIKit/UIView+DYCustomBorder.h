//
//  UIView+DYCustomBorder.h
//  FitNess
//
//  Created by 黄德玉 on 2017/7/3.
//  Copyright © 2017年 none. All rights reserved.
//

#import <UIKit/UIKit.h>


typedef NS_OPTIONS(NSUInteger, DYExcludePoint) {
    DYExcludeStartPoint = 1 << 0,
    DYExcludeEndPoint = 1 << 1,
    DYExcludeAllPoint = ~0UL
};


@interface UIView (DYCustomBorder)

- (void)dy_addTopBorderWithColor:(UIColor *)color width:(CGFloat) borderWidth;
- (void)dy_addLeftBorderWithColor: (UIColor *) color width:(CGFloat) borderWidth;
- (void)dy_addBottomBorderWithColor:(UIColor *)color width:(CGFloat) borderWidth;
- (void)dy_addRightBorderWithColor:(UIColor *)color width:(CGFloat) borderWidth;

- (void)dy_removeTopBorder;
- (void)dy_removeLeftBorder;
- (void)dy_removeBottomBorder;
- (void)dy_removeRightBorder;


- (void)dy_addTopBorderWithColor:(UIColor *)color width:(CGFloat) borderWidth excludePoint:(CGFloat)point edgeType:(DYExcludePoint)edge;
- (void)dy_addLeftBorderWithColor: (UIColor *) color width:(CGFloat) borderWidth excludePoint:(CGFloat)point edgeType:(DYExcludePoint)edge;
- (void)dy_addBottomBorderWithColor:(UIColor *)color width:(CGFloat) borderWidth excludePoint:(CGFloat)point edgeType:(DYExcludePoint)edge;
- (void)dy_addRightBorderWithColor:(UIColor *)color width:(CGFloat) borderWidth excludePoint:(CGFloat)point edgeType:(DYExcludePoint)edge;


@end
