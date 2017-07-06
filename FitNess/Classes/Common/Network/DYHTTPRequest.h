//
//  DYHTTPRequest.h
//  FitNess
//
//  Created by 黄德玉 on 2017/7/3.
//  Copyright © 2017年 none. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger,DYHTTPRequestType) {
    YGHTTPRequestPost = 0,
    YGHTTPRequestGet,
};

typedef NSString * (^DYHTTPBodyEncodeBlock)(NSURLRequest *request, id parameters, NSError * *error);
typedef NSError * (^DYHTTPErrorHandleBlock)(id responseObject);
typedef id (^DYHTTPResponseHandleBlock)(id responseObject);


@interface DYHTTPRequest : NSObject

@property(nonatomic,assign) DYHTTPRequestType           requestType;

@property(nonatomic,assign) NSInteger                   timeOut;

@property(nonatomic,strong) NSDictionary *              requestHeader;

@property(nonatomic,strong) NSSet *                     responseSet;

@property(nonatomic,copy)   NSString *                  baseUrlStr;

@property(nonatomic,strong) id                          parameters;

@property(nonatomic,copy) DYHTTPBodyEncodeBlock         bodyEncodeBlock;

@property (nonatomic,copy) DYHTTPErrorHandleBlock       errorHandleBlock;

@property (nonatomic,copy) DYHTTPResponseHandleBlock    responseHandleBlock;    

@end
