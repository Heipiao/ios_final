//
//  Location.h
//  ios_final
//
//  Created by liu on 17/1/13.
//  Copyright © 2017年 liu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

@protocol FxLocationDelegate;
@interface Location : NSObject <CLLocationManagerDelegate>

@property(nonatomic, assign) id<FxLocationDelegate> delegate;

- (void)startLocation;

@end

@protocol FxLocationDelegate <NSObject>

- (void)didLocationCity:(NSString *)cityName;
- (void)didLocationAddress:(NSString *)address;

@end
