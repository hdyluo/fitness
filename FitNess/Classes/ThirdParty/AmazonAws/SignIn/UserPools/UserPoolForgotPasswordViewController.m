//
//  UserPoolForgotPasswordViewController.m
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

#import "UserPoolForgotPasswordViewController.h"
#import <AWSMobileHubHelper/AWSMobileHubHelper.h>
#import <AWSCognitoUserPoolsSignIn/AWSCognitoUserPoolsSignIn.h>
#import <AWSCognitoIdentityProvider/AWSCognitoIdentityProvider.h>
#import "FormTableCell.h"
#import "FormTableDelegate.h"
#import "UserPoolsUIHelper.h"

@interface UserPoolForgotPasswordViewController ()

@property (nonatomic, strong) AWSCognitoIdentityUserPool *pool;
@property (nonatomic, strong) AWSCognitoIdentityUser *user;
@property (nonatomic, strong) FormTableCell *userNameRow;
@property (nonatomic, strong) FormTableDelegate *tableDelegate;

@end

@interface UserPoolNewPasswordViewController ()

@property (nonatomic, strong) AWSCognitoIdentityUser *user;
@property (nonatomic, strong) FormTableCell *updatedPasswordRow;
@property (nonatomic, strong) FormTableCell *confirmationCodeRow;
@property (nonatomic, strong) FormTableDelegate *tableDelegate;

@end

@implementation UserPoolForgotPasswordViewController

#pragma mark - UIViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUp];
    self.pool = [AWSCognitoIdentityUserPool defaultCognitoIdentityUserPool];
}

- (void)setUp {
    _userNameRow = [[FormTableCell alloc] initWithPlaceHolder:@"User Name" type:InputTypeText];
    _tableDelegate = [FormTableDelegate new];
    [self.tableDelegate addCell:self.userNameRow];
    self.tableView.delegate = self.tableDelegate;
    self.tableView.dataSource = self.tableDelegate;
    [self.tableView reloadData];
    [UserPoolsUIHelper setUpFormShadowForView:self.tableFormView];
    [self setUpBackground];
}

- (void)setUpBackground {
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"Forgot Password";
    UIImageView *backgroundImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.tableFormView.center.y)];
    backgroundImageView.backgroundColor = [UIColor darkGrayColor];
    backgroundImageView.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    [self.view insertSubview:backgroundImageView atIndex:0];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {

    if([@"NewPasswordSegue" isEqualToString:segue.identifier]){
        UserPoolNewPasswordViewController * confirmForgot = segue.destinationViewController;
        confirmForgot.user = self.user;
    }
}

- (IBAction)onForgotPassword:(id)sender {
    NSString *userName = [self.tableDelegate getValueForCell:self.userNameRow forTableView:self.tableView];
    if ([userName isEqualToString:@""]) {
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Missing Username"
                                                                                 message:@"Please enter a valid username."
                                                                          preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *ok = [UIAlertAction actionWithTitle:@"Ok" style:UIAlertActionStyleDefault handler:nil];
        [alertController addAction:ok];
        [self presentViewController:alertController
                           animated:YES
                         completion:nil];
        return;
    }
    self.user = [self.pool getUser:userName];
    [[self.user forgotPassword] continueWithBlock:^id _Nullable(AWSTask<AWSCognitoIdentityUserForgotPasswordResponse *> * _Nonnull task) {
        dispatch_async(dispatch_get_main_queue(), ^{
            if(task.error){
                UIAlertController *alertController = [UIAlertController alertControllerWithTitle:task.error.userInfo[@"__type"]
                                                                                         message:task.error.userInfo[@"message"]
                                                                                  preferredStyle:UIAlertControllerStyleAlert];
                UIAlertAction *ok = [UIAlertAction actionWithTitle:@"Ok" style:UIAlertActionStyleDefault handler:nil];
                [alertController addAction:ok];
                [self presentViewController:alertController
                                   animated:YES
                                 completion:nil];
            }else {
                [self performSegueWithIdentifier:@"NewPasswordSegue" sender:sender];
            }
        });
        return nil;
    }];
}

@end

@implementation UserPoolNewPasswordViewController

#pragma mark - UIViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUp];
}

- (void)setUp {
    _confirmationCodeRow = [[FormTableCell alloc] initWithPlaceHolder:@"Confirmation Code" type:InputTypeText];
    _updatedPasswordRow = [[FormTableCell alloc] initWithPlaceHolder:@"New Password" type:InputTypePassword];
    _tableDelegate = [FormTableDelegate new];
    [self.tableDelegate addCell:self.confirmationCodeRow];
    [self.tableDelegate addCell:self.updatedPasswordRow];
    self.tableView.delegate = self.tableDelegate;
    self.tableView.dataSource = self.tableDelegate;
    [self.tableView reloadData];
    [UserPoolsUIHelper setUpFormShadowForView:self.tableFormView];
    [self setUpBackground];
}

- (void)setUpBackground {
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"Forgot Password";
    UIImageView *backgroundImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.tableFormView.center.y)];
    backgroundImageView.backgroundColor = [UIColor darkGrayColor];
    backgroundImageView.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    [self.view insertSubview:backgroundImageView atIndex:0];
}

- (IBAction)onUpdatePassword:(id)sender {
    //confirm forgot password with input from ui.
    NSString *confirmationCode = [self.tableDelegate getValueForCell:self.confirmationCodeRow forTableView:self.tableView];
    NSString *updatedPassword = [self.tableDelegate getValueForCell:self.updatedPasswordRow forTableView:self.tableView];
    if ([confirmationCode isEqualToString:@""] || [updatedPassword isEqualToString:@""]) {
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Missing Information"
                                                                                 message:@"Please enter valid confirmation code and password values."
                                                                          preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *ok = [UIAlertAction actionWithTitle:@"Ok" style:UIAlertActionStyleDefault handler:nil];
        [alertController addAction:ok];
        [self presentViewController:alertController
                           animated:YES
                         completion:nil];
        return;
    }
    [[self.user confirmForgotPassword:confirmationCode password:updatedPassword] continueWithBlock:^id _Nullable(AWSTask<AWSCognitoIdentityUserConfirmForgotPasswordResponse *> * _Nonnull task) {
        dispatch_async(dispatch_get_main_queue(), ^{
            if(task.error){
                
                UIAlertController *alertController = [UIAlertController alertControllerWithTitle:task.error.userInfo[@"__type"]
                                                                                         message:task.error.userInfo[@"message"]
                                                                                  preferredStyle:UIAlertControllerStyleAlert];
                UIAlertAction *ok = [UIAlertAction actionWithTitle:@"Ok" style:UIAlertActionStyleDefault handler:nil];
                [alertController addAction:ok];
                [self presentViewController:alertController
                                   animated:YES
                                 completion:nil];
                
            }else {
                UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Password Reset Complete"
                                                                                         message:@"Password Reset was completed successfully."
                                                                                  preferredStyle:UIAlertControllerStyleAlert];
                UIAlertAction *ok = [UIAlertAction actionWithTitle:@"Ok" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                [self.navigationController popToRootViewControllerAnimated:YES];
                }];
                [alertController addAction:ok];
                [self presentViewController:alertController
                                   animated:YES
                                 completion:nil];
            }
        });
        return nil;
    }];
}

@end
