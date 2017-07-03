//
//  DYHTTPRequest.m
//  FitNess
//
//  Created by 黄德玉 on 2017/7/3.
//  Copyright © 2017年 none. All rights reserved.
//

#import "DYHTTPRequest.h"

@implementation DYHTTPRequest

- (instancetype)init{
    if (self = [super init]) {
        self.requestType                = YGHTTPRequestPost;
        self.timeOut                    = 10;
        self.requestHeader              = @{@"Content-Type": @"application/x-www-form-urlencoded;charset=utf-8"};
        self.responseSet                = [NSSet setWithObjects:@"application/x-www-form-urlencoded",@"application/json", @"text/html",@"text/json",@"text/javascript",@"text/plain",nil];
        //        self.bodyEncodeBlock = ^NSString * _Nonnull(NSURLRequest * _Nonnull request, id  _Nonnull parameters, NSError * _Nullable __autoreleasing * _Nullable error) {
        //            if ([parameters isKindOfClass:[NSDictionary class]]) {
        //                NSDictionary * dic = (NSDictionary *)parameters;
        //                NSError *error;
        //                NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dic options:0 error:&error];
        //                NSString *jsonString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
        //                DLog(@"%@", jsonString);
        //                return jsonString;
        //            }
        //            return nil;
        //        };
    }
    return self;
}

@end
