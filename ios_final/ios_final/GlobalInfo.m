//
//  GlobalInfo.m
//  ios_final
//
//  Created by liu on 17/1/20.
//  Copyright © 2017年 liu. All rights reserved.
//

#import "GlobalInfo.h"
#import <UIKit/UIKit.h>


@implementation GlobalInfo

+ (GlobalInfo *)global
{
    static GlobalInfo *s_global = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        s_global = [[GlobalInfo alloc] init];
    });
    
    return s_global;
}

- (id)init
{
    self = [super init];
    if (self) {
        //self.userInfo = [[UserInfo alloc] init];
    }
    
    return self;
}

+ (BOOL)isSystemLowIOS8
{
    UIDevice *device = [UIDevice currentDevice];
    CGFloat systemVer = [[device systemVersion] floatValue];
    if (systemVer - IOSBaseVersion8 < -0.001) {
        return YES;
    }
    
    return NO;
}

+ (BOOL)isSystemLowIOS7
{
    UIDevice *device = [UIDevice currentDevice];
    CGFloat systemVer = [[device systemVersion] floatValue];
    if (systemVer - IOSBaseVersion7 < -0.001) {
        return YES;
    }
    
    return NO;
}

+ (BOOL)isSystemLowiOS6
{
    UIDevice *device = [UIDevice currentDevice];
    CGFloat systemVer = [[device systemVersion] floatValue];
    if (systemVer < IOSBaseVersion6) {
        return YES;
    }
    
    return NO;
}


@end
