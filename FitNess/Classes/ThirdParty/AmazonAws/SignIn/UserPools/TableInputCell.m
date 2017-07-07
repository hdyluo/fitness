//
//  TableInputCell.m
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

#import "TableInputCell.h"

@implementation TableInputCell

// Handle event when user finishes inputting text into a text field
- (IBAction)textEditingDidEnd:(id)sender {
    if ([self.inputBox.text isEqual: @""]) {
        self.placeHolderView.alpha = 0;
        self.placeHolderView.hidden = NO;
        [UIView animateWithDuration:0.5
                         animations:^{
                             self.placeHolderView.alpha = 1;
                             self.headerLabel.hidden = YES;
                             self.inputBox.hidden = YES;
                         }];
    }
}

- (void)onTap {
    dispatch_async(dispatch_get_main_queue(), ^{
       [UIView transitionWithView:self.placeHolderView
                         duration:0.5
                          options:UIViewAnimationOptionTransitionCrossDissolve
                       animations:^{
                           self.placeHolderView.hidden = YES;
                           self.headerLabel.hidden = NO;
                           self.inputBox.hidden = NO;
                       } completion:nil];
        [self.inputBox becomeFirstResponder];
    });
}

@end
