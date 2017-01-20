//
//  AppDelegate.m
//  ios_final
//
//  Created by liu on 17/1/20.
//  Copyright © 2017年 liu. All rights reserved.
//

#import "AppDelegate.h"
#import "LoginPage.h"
#import "HomePage.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

+ (AppDelegate *)appDeg
{
    return  (AppDelegate *)[UIApplication sharedApplication].delegate;
}

-(void)showLoginPage
{
    LoginPage *page = [[LoginPage alloc]init];
    self.window.rootViewController = page;
    [self.window makeKeyAndVisible];
}

-(void)showHomePage
{
    HomePage *page = [[HomePage alloc] init];
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:page];
    self.window.rootViewController = nav;
    [self.window makeKeyAndVisible];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [FIRApp configure];
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    [self showLoginPage];
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
}


- (void)applicationWillTerminate:(UIApplication *)application {
}

@end
