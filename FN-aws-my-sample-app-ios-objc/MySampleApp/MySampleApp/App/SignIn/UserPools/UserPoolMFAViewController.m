//
//  UserPoolMFAViewController.m
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

#import "UserPoolMFAViewController.h"
#import <AWSMobileHubHelper/AWSMobileHubHelper.h>
#import "FormTableCell.h"
#import "FormTableDelegate.h"
#import "UserPoolsUIHelper.h"

@interface UserPoolMFAViewController () 

@property (strong, nonatomic) NSString *destination;
@property (nonatomic,strong) AWSTaskCompletionSource<NSString *>* mfaCodeCompletionSource;
@property (nonatomic, strong) FormTableCell *authenticationCodeRow;
@property (nonatomic, strong) FormTableDelegate *tableDelegate;

@end

@implementation UserPoolMFAViewController

#pragma mark - UIViewController

- (void) viewWillAppear:(BOOL)animated {
    self.codeSentTo.text = self.destination;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUp];
}

- (void)setUp {
    _authenticationCodeRow = [[FormTableCell alloc] initWithPlaceHolder:@"Authentication Code" type:InputTypeText];
    _tableDelegate = [FormTableDelegate new];
    [self.tableDelegate addCell:self.authenticationCodeRow];
    self.tableView.delegate = self.tableDelegate;
    self.tableView.dataSource = self.tableDelegate;
    [self.tableView reloadData];
    [UserPoolsUIHelper setUpFormShadowForView:self.tableFormView];
    [self setUpBackground];
}

- (void)setUpBackground {
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"MFA";
    UIImageView *backgroundImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.tableFormView.center.y)];
    backgroundImageView.backgroundColor = [UIColor darkGrayColor];
    backgroundImageView.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    [self.view insertSubview:backgroundImageView atIndex:0];
}

- (IBAction)onSignIn:(id)sender {
    self.mfaCodeCompletionSource.result = [self.tableDelegate getValueForCell:self.authenticationCodeRow
                                                                 forTableView:self.tableView];
}

-(void) getMultiFactorAuthenticationCode: (AWSCognitoIdentityMultifactorAuthenticationInput *)authenticationInput mfaCodeCompletionSource: (AWSTaskCompletionSource<NSString *> *) mfaCodeCompletionSource {
    self.mfaCodeCompletionSource = mfaCodeCompletionSource;
    self.destination = authenticationInput.destination;
}


-(void) didCompleteMultifactorAuthenticationStepWithError:(NSError*) error {
    dispatch_async(dispatch_get_main_queue(), ^{
        if(error){
            UIAlertController *alertController = [UIAlertController alertControllerWithTitle:error.userInfo[@"__type"]
                                                                                     message:error.userInfo[@"message"]
                                                                              preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction *ok = [UIAlertAction actionWithTitle:@"Ok" style:UIAlertActionStyleDefault handler:nil];
            [alertController addAction:ok];
            [self presentViewController:alertController
                               animated:YES
                             completion:nil];
        }
    });
}


@end