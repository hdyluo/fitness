//
//  DYHTTPManager.h
//  FitNess
//
//  Created by 黄德玉 on 2017/7/3.
//  Copyright © 2017年 none. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DYHTTPRequest.h"

typedef void(^DYHttpCompletionCallback)(NSError * err,id object);

@interface DYHTTPManager : NSObject

+ (instancetype)sharedManager;

- (NSURLSessionDataTask *)queryWithRequest:(DYHTTPRequest *)request
                                completion:(DYHttpCompletionCallback)block;

@end
