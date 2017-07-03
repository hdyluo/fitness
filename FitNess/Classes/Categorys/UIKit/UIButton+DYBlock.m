//
//  UIButton+DYBlock.m
//  FitNess
//
//  Created by 黄德玉 on 2017/7/3.
//  Copyright © 2017年 none. All rights reserved.
//

#import "UIButton+DYBlock.h"
#import <objc/runtime.h>

static const void *dy_UIButtonBlockKey = &dy_UIButtonBlockKey;

@implementation UIButton (DYBlock)


- (void)dy_addTouchUpInsideBlock:(void (^)(UIButton *))block{
    objc_setAssociatedObject(self, dy_UIButtonBlockKey, block, OBJC_ASSOCIATION_COPY_NONATOMIC);
    [self addTarget:self action:@selector(_dy_blockActionTouched:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)_dy_blockActionTouched:(UIButton *)button{
    void (^block)(UIButton *) =   objc_getAssociatedObject(self, dy_UIButtonBlockKey);
    if (block) {
        block(button);
    }
}

@end
