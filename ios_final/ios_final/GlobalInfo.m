//
//  GlobalInfo.m
//  ios_final
//
//  Created by liu on 17/1/20.
//  Copyright © 2017年 liu. All rights reserved.
//

#import "GlobalInfo.h"


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

@end
