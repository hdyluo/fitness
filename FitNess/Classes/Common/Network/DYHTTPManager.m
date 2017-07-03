//
//  DYHTTPManager.m
//  FitNess
//
//  Created by 黄德玉 on 2017/7/3.
//  Copyright © 2017年 none. All rights reserved.
//

#import "DYHTTPManager.h"
#import <AFNetworking/AFNetworking.h>


typedef DYHTTPManager * (^nextTaskBlock)(DYHTTPRequest * request,DYHttpCompletionCallback callback);

typedef void (^DYHTTPSuccessBlock)(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject);
typedef void (^DYHTTTPErrorBlock)(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error);

@interface DYHTTPManager ()
@property(strong) AFHTTPSessionManager * sessionManager;
@end

@implementation DYHTTPManager


+ (instancetype)sharedManager{
    static DYHTTPManager * manager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[DYHTTPManager alloc] init];
        manager.sessionManager = [AFHTTPSessionManager manager];
    });
    return manager;
}

- (NSURLSessionDataTask *)queryWithRequest:(DYHTTPRequest *)request
                                completion:(DYHttpCompletionCallback)block{
    [self _dealWithRequest:request];
    DYHTTPSuccessBlock successBlock = ^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSError * error = nil;
        if (request.errorHandleBlock) {
            error = request.errorHandleBlock(responseObject);
        }
        if (error) {
            if (block) {
                block(error,nil);
            }
            return;
        }
        id response = responseObject;
        if (request.responseHandleBlock) {
            response = request.responseHandleBlock(responseObject);
        }
        if (block) {
            block(nil,response);
        }
    };
    DYHTTTPErrorBlock errorBlock = ^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (error.code != NSURLErrorCancelled) {
            if (block) {
                block(error,nil);
            }
        }
    };
    switch (request.requestType) {
        case YGHTTPRequestGet:
            return [self.sessionManager GET:request.baseUrlStr
                                 parameters:request.parameters
                                   progress:nil
                                    success:successBlock
                                    failure:errorBlock
                    ];
            break;
        case YGHTTPRequestPost:
            return [self.sessionManager POST:request.baseUrlStr
                                  parameters:request.parameters
                                    progress:nil
                                     success:successBlock
                                     failure:errorBlock
                    ];
            break;
        default:
            break;
    }
    return nil;
}



- (void)_dealWithRequest:(DYHTTPRequest *)request{
    if (request.responseSet) {
        self.sessionManager.responseSerializer.acceptableContentTypes = request.responseSet;
    }
    if (request.timeOut) {
        self.sessionManager.requestSerializer.timeoutInterval = request.timeOut;
    }
    if (request.requestHeader) {
        [request.requestHeader enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
            [self.sessionManager.requestSerializer setValue:obj forHTTPHeaderField:key];
        }];
    }
    [self.sessionManager.requestSerializer setQueryStringSerializationWithBlock:request.bodyEncodeBlock];
}

@end
