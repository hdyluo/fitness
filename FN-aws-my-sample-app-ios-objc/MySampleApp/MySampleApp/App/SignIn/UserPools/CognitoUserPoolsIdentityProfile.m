//
//  AWSCognitoUserPoolsIdentityProfile.m
//  MySampleApp
//
//
// Copyright 2017 Amazon.com, Inc. or its affiliates (Amazon). All Rights Reserved.
//
// Code generated by AWS Mobile Hub. Amazon gives unlimited permission to 
// copy, distribute and modify it.
//
// Source code generated from template: aws-my-sample-app-ios-objc v0.20
//
//

#import "CognitoUserPoolsIdentityProfile.h"
#import <AWSCognitoUserPoolsSignIn/AWSCognitoUserPoolsSignIn.h>
#import <AWSCognitoIdentityProvider/AWSCognitoIdentityProvider.h>

@interface CognitoUserPoolsIdentityProfile()

@property (nonatomic, readwrite, nullable) NSURL *imageURL;
@property (nonatomic, readwrite, nullable) NSString *userName;
@property (nonatomic, readwrite, nullable) NSMutableDictionary<NSString *, id> *identityProfileDict;

@end

@implementation CognitoUserPoolsIdentityProfile

@synthesize userName;
@synthesize imageURL;

+ (instancetype)sharedInstance {
    static CognitoUserPoolsIdentityProfile *_sharedCognitoUserPoolsIdentityProfile = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedCognitoUserPoolsIdentityProfile = [[CognitoUserPoolsIdentityProfile alloc] init];
        
    });
    
    return _sharedCognitoUserPoolsIdentityProfile;
}

- (instancetype)init {
    if (self = [super init]) {
        _identityProfileDict = [[NSMutableDictionary alloc] init];
    }
    return self;
}

-(void)setProfileAttribute:(id)value
                    forKey:(NSString *)key {
    [self.identityProfileDict setObject:value
                                 forKey:key];
}

-(id)getProfileAttributeForKey:(NSString *)key {
    return [self.identityProfileDict objectForKey:key];
}

-(NSDictionary *)getProfileAttributesMap {
    return self.identityProfileDict;
}

-(void)clearProfile {
    self.userName = nil;
    self.imageURL = nil;
    self.identityProfileDict = [[NSMutableDictionary alloc] init];
}

-(void)loadProfile {
    self.userName = [[AWSCognitoUserPoolsSignInProvider sharedInstance] getUserPool].currentUser.username;
    // You can set additional profile attributes here. This method is called once the user logs in  with the sign-in provider.
}

@end

