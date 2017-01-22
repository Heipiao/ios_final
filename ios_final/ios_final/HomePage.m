//
//  HomePage.m
//  ios_final
//
//  Created by liu on 17/1/2.
//  Copyright © 2017年 liu. All rights reserved.
//
#import <UIKit/UIKit.h>
#import "HomePage.h"
#import "PageInfo.h"



@interface HomePage ()

@end

@implementation HomePage

- (id)init
{
    self = [super init];
    if (self) {
        [self addTabControllers];
      
    }
    
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (void)addTabControllers
{
    self.tabBar.backgroundImage = [UIImage imageNamed:@"tarbar1.png"];
    //self.tabBar.tintColor = RgbColor(198 , 91, 91);
    self.viewControllers = [PageInfo pageControllers];
}




@end
