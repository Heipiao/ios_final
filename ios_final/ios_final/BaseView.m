//
//  BaseView.m
//  ios_final
//
//  Created by liu on 17/1/20.
//  Copyright © 2017年 liu. All rights reserved.
//

#import "BaseView.h"

@interface BaseView ()

@end

@implementation BaseView

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setNavBarImage
{
    UIImage *image = [UIImage imageNamed:@"tarbar.png"];
    [self.navigationController.navigationBar setBackgroundImage:image forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setTintColor:[UIColor blackColor]];
    
    NSDictionary *attribute = @{
                                NSForegroundColorAttributeName:[UIColor whiteColor],
                                NSFontAttributeName:[UIFont systemFontOfSize:18]
                                };
    
    [self.navigationController.navigationBar setTitleTextAttributes:attribute];
}



@end
