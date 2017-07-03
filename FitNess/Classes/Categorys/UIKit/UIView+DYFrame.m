//
//  UIView+DYFrame.m
//  FitNess
//
//  Created by 黄德玉 on 2017/7/3.
//  Copyright © 2017年 none. All rights reserved.
//

#import "UIView+DYFrame.h"

@implementation UIView (DYFrame)

#pragma mark - Shortcuts for the coords

- (CGFloat)dy_top
{
    return self.frame.origin.y;
}

- (void)setDy_top:(CGFloat)y
{
    CGRect frame = self.frame;
    frame.origin.y = y;
    self.frame = frame;
}

- (CGFloat)dy_right
{
    return self.frame.origin.x + self.frame.size.width;
}

- (void)setDy_right:(CGFloat)right
{
    CGRect frame = self.frame;
    frame.origin.x = right - self.frame.size.width;
    self.frame = frame;
}

- (CGFloat)dy_bottom
{
    return self.frame.origin.y + self.frame.size.height;
}

- (void)setDy_bottom:(CGFloat)bottom
{
    CGRect frame = self.frame;
    frame.origin.y = bottom - self.frame.size.height;
    self.frame = frame;
}

- (CGFloat)dy_left
{
    return self.frame.origin.x;
}

- (void)setDy_left:(CGFloat)x
{
    CGRect frame = self.frame;
    frame.origin.x = x;
    self.frame = frame;
}

- (CGFloat)dy_width
{
    return self.frame.size.width;
}

- (void)setDy_width:(CGFloat)width
{
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
}

- (CGFloat)dy_height
{
    return self.frame.size.height;
}

- (void)setDy_height:(CGFloat)height
{
    CGRect frame = self.frame;
    frame.size.height = height;
    self.frame = frame;
}

#pragma mark - Shortcuts for frame properties

- (CGPoint)dy_origin {
    return self.frame.origin;
}

- (void)setDy_origin:(CGPoint)origin {
    CGRect frame = self.frame;
    frame.origin = origin;
    self.frame = frame;
}

- (CGSize)dy_size {
    return self.frame.size;
}

- (void)setDy_size:(CGSize)size {
    CGRect frame = self.frame;
    frame.size = size;
    self.frame = frame;
}
#pragma mark - Shortcuts for positions

- (CGFloat)dy_centerX {
    return self.center.x;
}

- (void)setDy_centerX:(CGFloat)centerX {
    self.center = CGPointMake(centerX, self.center.y);
}

- (CGFloat)dy_centerY {
    return self.center.y;
}

- (void)setDy_centerY:(CGFloat)centerY {
    self.center = CGPointMake(self.center.x, centerY);
}



@end
