//
//  UIViewController+SH.m
//  Frey
//
//  Created by huangdeyu on 16/2/24.
//  Copyright © 2016年 shcem. All rights reserved.
//

#import "UIViewController+SH.h"
#import "MBProgressHUD.h"

@implementation UIViewController (SH)
-(void)clearAllBgColor{
    for (UIView * subView in self.view.subviews) {
        subView.backgroundColor = [UIColor clearColor];
    }
}
- (void)showNetworkIndicator{
    UIApplication* app=[UIApplication sharedApplication];
    app.networkActivityIndicatorVisible=YES;
}
- (void)hideNetworkIndicator{
    UIApplication* app=[UIApplication sharedApplication];
    app.networkActivityIndicatorVisible=NO;
}

- (void)showProgress{
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
}
- (void)hideProgress{
    [MBProgressHUD hideAllHUDsForView:self.view animated:YES];
}

-(void)showError:(NSError *)error{
    
    if ([error.domain isEqualToString:NSURLErrorDomain]) {
        switch (error.code) {
            case NSURLErrorNotConnectedToInternet:
                [self toast:@"网络连接失败"];
                break;
            case NSURLErrorCancelled:
                DLog(@"任务被取消");     //这个已经没有回调，不会调用
                break;
            case NSURLErrorTimedOut:
                [self toast:@"请求超时"];
                break;
            case NSURLErrorUnknown:
            case NSURLErrorCannotFindHost:
            case NSURLErrorBadURL:
            case NSURLErrorBadServerResponse:
                [self toast:@"连接服务器失败"];
                break;
            default:
               [self toast:@"连接服务器失败"];
                break;
        }
    }
}


- (void)toast:(NSString *)text{
    if (text == nil || text.length == 0 ) {
        text = @"服务器未返回数据";
    }
    [self toast:text duration:1.5];
}

- (void)toast:(NSString *)text duration:(NSTimeInterval)duration{
   // if ([MBProgressHUD HUDForView:self.view] == nil) {
        MBProgressHUD* hud=[MBProgressHUD showHUDAddedTo:self.view animated:YES];
        hud.userInteractionEnabled = NO;
        hud.detailsLabel.font = [UIFont systemFontOfSize:14];
        hud.detailsLabel.text = [NSString  stringWithFormat:@" %@ ",text];
        hud.margin=10.f;
        hud.removeFromSuperViewOnHide=YES;
        hud.mode=MBProgressHUDModeText;
        [hud hideAnimated:YES afterDelay:duration];
  //  }
}

@end
