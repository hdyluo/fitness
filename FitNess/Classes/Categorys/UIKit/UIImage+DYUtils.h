//
//  UIImage+DYUtils.h
//  FitNess
//
//  Created by 黄德玉 on 2017/7/3.
//  Copyright © 2017年 none. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (DYUtils)

+ (UIImage *)dy_captureWithView:(UIView *)view;

+ (UIImage *)dy_getImageWithSize:(CGRect)myImageRect FromImage:(UIImage *)bigImage;

+ (UIImage *)dy_screenshotWithView:(UIView *)aView limitWidth:(CGFloat)maxWidth;


+ (UIImage *)dy_imageWithColor:(UIColor *)color;

- (UIColor *)dy_colorAtPoint:(CGPoint )point;

- (UIColor *)dy_colorAtPixel:(CGPoint)point;

- (BOOL)dy_hasAlphaChannel;

+ (UIImage*)dy_covertToGrayImageFromImage:(UIImage*)sourceImage;

+ (UIImage *)dy_imageWithFileName:(NSString *)name;

+ (UIImage *)dy_imageWithFileName:(NSString *)name inBundle:(NSBundle*)bundle;

@end
