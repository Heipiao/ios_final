//
//  PageInfo.h
//  ios_final
//
//  Created by liu on 17/1/20.
//  Copyright © 2017年 liu. All rights reserved.
//

#import "BaseInfo.h"

@interface PageInfo : BaseInfo

@property(nonatomic, strong) NSString    *image;
@property(nonatomic, strong) NSString    *selectImage;
@property(nonatomic, assign) BOOL        unLoad;


+ (NSArray *)pageControllers;

@end
