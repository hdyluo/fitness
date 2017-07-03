//
//  UIColor+DYUtils.h
//  FitNess
//
//  Created by 黄德玉 on 2017/7/3.
//  Copyright © 2017年 none. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (DYUtils)

+ (UIColor *)dy_randomColor;

+ (UIColor*)dy_gradientFromColor:(UIColor*)c1 toColor:(UIColor*)c2 withHeight:(int)height;

@end
