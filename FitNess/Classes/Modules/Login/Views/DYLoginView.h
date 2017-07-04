//
//  DYLoginView.h
//  FitNess
//
//  Created by 黄德玉 on 2017/7/4.
//  Copyright © 2017年 none. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol DYLoginViewDelegate <NSObject>

- (void)btnClickeWithTag:(NSInteger)tag;

@end

@interface DYLoginView : UIView

@property (nonatomic,weak) id<DYLoginViewDelegate> delegate;

@end
