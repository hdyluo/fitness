//
//  AppDelegate.m
//  FitNess
//
//  Created by 黄德玉 on 2017/7/3.
//  Copyright © 2017年 none. All rights reserved.
//

#import "AppDelegate.h"
#import "AppDelegate+DYUI.h"
#import "AppDelegate+AWS.h"

static NSString *const SNSPlatformApplicationArn = @"arn:aws:sns:us-west-2:059804913307:endpoint/APNS_SANDBOX/hdy/5f2457ce-aaf5-3a6d-bd54-db011d6e95e9";
AWSRegionType const CognitoRegionType = AWSRegionUSWest2;
AWSRegionType const DefaultServiceRegionType = AWSRegionCNNorth1;
NSString *const CognitoIdentityPoolId = @"us-east-1:0..................";

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [self setupUI];
    [self setupNotification];
    return YES;
}

- (void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken {
    NSString *deviceTokenString = [[[deviceToken description] stringByTrimmingCharactersInSet:[NSCharacterSet characterSetWithCharactersInString:@"<>"]] stringByReplacingOccurrencesOfString:@" " withString:@""];
    
    NSLog(@"deviceTokenString: %@", deviceTokenString);
    [[NSUserDefaults standardUserDefaults] setObject:deviceTokenString forKey:@"deviceToken"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
    
    // Sets up the AWS Mobile SDK for iOS
    AWSCognitoCredentialsProvider *credentialsProvider =   [[AWSCognitoCredentialsProvider alloc] initWithRegionType:CognitoRegionType identityPoolId:CognitoIdentityPoolId];
    
    
    AWSServiceConfiguration *defaultServiceConfiguration = [[AWSServiceConfiguration alloc] initWithRegion:DefaultServiceRegionType
                                                                                       credentialsProvider:credentialsProvider];
    
    AWSServiceManager.defaultServiceManager.defaultServiceConfiguration = defaultServiceConfiguration;

    
    
    AWSSNS *sns = [AWSSNS defaultSNS];
    AWSSNSCreatePlatformEndpointInput *request = [AWSSNSCreatePlatformEndpointInput new];
    request.token = deviceTokenString;
    request.platformApplicationArn = SNSPlatformApplicationArn;
    [[sns createPlatformEndpoint:request] continueWithBlock:^id(AWSTask *task) {
        if (task.error != nil) {
            NSLog(@"Error: %@",task.error);
        } else {
            AWSSNSCreateEndpointResponse *createEndPointResponse = task.result;
            NSLog(@"endpointArn: %@",createEndPointResponse);
            [[NSUserDefaults standardUserDefaults] setObject:createEndPointResponse.endpointArn forKey:@"endpointArn"];
            [[NSUserDefaults standardUserDefaults] synchronize];
//            [self.window.rootViewController.childViewControllers.firstObject performSelectorOnMainThread:@selector(displayDeviceInfo) withObject:nil waitUntilDone:NO];
            
        }
        
        return nil;
    }];
}

- (void)application:(UIApplication *)application didFailToRegisterForRemoteNotificationsWithError:(NSError *)error {
    NSLog(@"Failed to register with error: %@",error);
}

- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo {
    NSLog(@"userInfo: %@",userInfo);
}

- (void)application:(UIApplication *)application handleActionWithIdentifier:(NSString *)identifier forRemoteNotification:(NSDictionary *)userInfo completionHandler:(void (^)())completionHandler {
    
//    AWSMobileAnalytics *mobileAnalytics = [AWSMobileAnalytics defaultMobileAnalytics];
//    id<AWSMobileAnalyticsEventClient> eventClient = mobileAnalytics.eventClient;
//    id<AWSMobileAnalyticsEvent> pushNotificationEvent = [eventClient createEventWithEventType:@"PushNotificationEvent"];
//    
    NSString *action = @"Undefined";
    if ([identifier isEqualToString:@"READ_IDENTIFIER"]) {
        action = @"read";
        NSLog(@"User selected 'Read'");
    } else if ([identifier isEqualToString:@"DELETE_IDENTIFIER"]) {
        action = @"Deleted";
        NSLog(@"User selected `Delete`");
    } else {
        action = @"Undefined";
    }
    
//    [pushNotificationEvent addAttribute:action forKey:@"Action"];
//    [eventClient recordEvent:pushNotificationEvent];
    
//    [self.window.rootViewController.childViewControllers.firstObject performSelectorOnMainThread:@selector(displayUserAction:)
//                                                                                      withObject:action
//                                                                                   waitUntilDone:NO];
    
    completionHandler();
}


@end
