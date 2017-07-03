//
//  UIButton+DYBlock.h
//  FitNess
//
//  Created by 黄德玉 on 2017/7/3.
//  Copyright © 2017年 none. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (DYBlock)

- (void)dy_addTouchUpInsideBlock:(void (^)(UIButton * button))block;

@end
