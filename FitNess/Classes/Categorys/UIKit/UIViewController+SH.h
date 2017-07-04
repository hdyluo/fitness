//
//  UIViewController+SH.h
//  Frey
//
//  Created by huangdeyu on 16/2/24.
//  Copyright © 2016年 shcem. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (SH)
-(void)clearAllBgColor;
- (void)showNetworkIndicator;
- (void)hideNetworkIndicator;

- (void)showProgress;
- (void)hideProgress;

-(void)showError:(NSError *)error;

- (void)toast:(NSString *)text;

- (void)toast:(NSString *)text duration:(NSTimeInterval)duration;

@end
