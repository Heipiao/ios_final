//
//  GlobalInfo.h
//  ios_final
//
//  Created by liu on 17/1/20.
//  Copyright © 2017年 liu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UserInfo.h"

@interface GlobalInfo : NSObject

+ (GlobalInfo *)global;
@property(nonatomic, strong) UserInfo *useInfo;

@end
