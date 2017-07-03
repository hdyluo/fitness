//
//  UIView+DYFrame.h
//  FitNess
//
//  Created by 黄德玉 on 2017/7/3.
//  Copyright © 2017年 none. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (DYFrame)

// shortcuts for frame properties
@property (nonatomic, assign) CGPoint dy_origin;
@property (nonatomic, assign) CGSize dy_size;

// shortcuts for positions
@property (nonatomic) CGFloat dy_centerX;
@property (nonatomic) CGFloat dy_centerY;


@property (nonatomic) CGFloat dy_top;
@property (nonatomic) CGFloat dy_bottom;
@property (nonatomic) CGFloat dy_right;
@property (nonatomic) CGFloat dy_left;

@property (nonatomic) CGFloat dy_width;
@property (nonatomic) CGFloat dy_height;

@end
