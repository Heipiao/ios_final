//
//  LoginPage.m
//  ios_final
//
//  Created by liu on 17/1/20.
//  Copyright © 2017年 liu. All rights reserved.
//

#import "LoginPage.h"
#import "AppDelegate.h"


@import FirebaseAuth;
@import Firebase;

@interface LoginPage ()

@end

@implementation LoginPage

- (void)viewDidLoad {
    [super viewDidLoad];
  
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
   
}

- (IBAction)EmailLogin:(id)sender {
    [[FIRAuth auth] signInWithEmail:_emailField.text
                           password:_passwordField.text
                         completion:^(FIRUser *user, NSError *error) {
                             if (error) {
                                 //[self showMessagePrompt:error.localizedDescription];
                                 return;
                             }
                             [[AppDelegate appDeg] showHomePage];
                         }];
}



@end
