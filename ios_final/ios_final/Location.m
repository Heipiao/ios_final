//
//  Location.m
//  ios_final
//
//  Created by liu on 17/1/20.
//  Copyright © 2017年 liu. All rights reserved.
//

#import "Location.h"
#import "GlobalInfo.h"

@implementation Location {
    CLLocationManager   *_manager;
}

- (id)init
{
    self = [super init];
    if (self) {
    }
    
    return self;
}

- (void)startLocation
{
    if ([CLLocationManager locationServicesEnabled]) {
        _manager = [[CLLocationManager alloc] init];
        
        _manager.delegate = self;
        //控制定位精度,越高耗电量越大
        _manager.desiredAccuracy = kCLLocationAccuracyBest;
        //控制定位服务更新频率。单位是“米”
        _manager.distanceFilter = LocationDistance;
        
        [_manager startUpdatingLocation];
        
        if (![GlobalInfo isSystemLowIOS8]) {
            [_manager requestAlwaysAuthorization];
        }
    }
}

- (void)searchCityName:(CLLocation *)location
{
    CLGeocoder *coder = [[CLGeocoder alloc] init];
    
    [coder reverseGeocodeLocation:location completionHandler:^(NSArray *placemarks, NSError *error) {
        for (CLPlacemark *mark in placemarks) {
            BASE_INFO_FUN(mark.name);
            BASE_INFO_FUN(mark.locality);
            NSString *cityName = [mark.locality stringByReplacingOccurrencesOfString:CitySuffix withString:@""];
            
            [self.delegate didLocationCity:cityName];
            [self.delegate didLocationAddress:mark.name];
            
            break;
        }
    }];
}

- (void)locationManager:(CLLocationManager *)manager didChangeAuthorizationStatus:(CLAuthorizationStatus)status
{
    BASE_ERROR_FUN(([NSString stringWithFormat:@"status:%@",@(status)]));
}

- (void)locationManager:(CLLocationManager *)manager
    didUpdateToLocation:(CLLocation *)newLocation
           fromLocation:(CLLocation *)oldLocation
{
    [self searchCityName:newLocation];
}

-(void)locationManager:(CLLocationManager *)manager
    didUpdateLocations:(NSArray *)locations
{
    CLLocation *newLocation = [locations firstObject];
    
    [self searchCityName:newLocation];

    [_manager stopUpdatingLocation];
}

@end

