//
//  GlobalInfo.h
//  ios_final
//
//  Created by liu on 17/1/20.
//  Copyright © 2017年 liu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UserInfo.h"
#import "Defines.h"

@interface GlobalInfo : NSObject

+ (GlobalInfo *)global;
+ (BOOL)isSystemLowIOS8;
+ (BOOL)isSystemLowIOS7;
+ (BOOL)isSystemLowiOS6;
@property(nonatomic, strong) UserInfo *useInfo;

@end
