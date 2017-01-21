//
//  PicPages.m
//  ios_final
//
//  Created by liu on 17/1/20.
//  Copyright © 2017年 liu. All rights reserved.
//

#import "PicPages.h"
#import "Location.h"
#import "GlobalInfo.h"

@interface PicPages () <FxLocationDelegate>{
    Location *_location;
}
@end

@implementation PicPages

-(void)viewDidLoad {
    [super viewDidLoad];
    [self setNavBarImage];
    
    [self reloadLocation];
}

- (IBAction)doLocation:(id)sender
{
    [self reloadLocation];
    
}

-(void) reloadLocation
{
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
    _location = [[Location alloc]init];
    
    _location.delegate = self;
    [_location startLocation];
    
    
}

-(void) didLocationAddress:(NSString *)address
{
    BASE_INFO_FUN(address);
}

-(void) didLocationCity:(NSString *)cityName
{
    [self setNavigationLeft:cityName];
    
    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
    
    
}


@end
