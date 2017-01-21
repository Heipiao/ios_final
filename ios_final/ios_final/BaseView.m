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
- (UIButton *)customButton:(NSString *)imageName
                  selector:(SEL)sel
{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    
    btn.frame = CGRectMake(0, 0, 30, 44);
    [btn setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    [btn addTarget:self action:sel forControlEvents:UIControlEventTouchUpInside];
    
    return btn;
}

- (void)setNavigationRight
{
    UIView *rightView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 30, 44)];
   // UIButton *searchBtn = [self customButton:@"search.png" selector:@selector(doSearch:)];
    UIButton *locationBtn = [self customButton:@"location_button.png" selector:@selector(doLocation:)];
    
  //  [rightView addSubview:searchBtn];
    [rightView addSubview:locationBtn];
    
    CGRect frame = locationBtn.frame;
    frame.origin.x = 0;
    locationBtn.frame = frame;
    
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithCustomView:rightView];
    
    self.navigationItem.rightBarButtonItem = item;
}

- (void)setNavigationLeft:(NSString *)name
{
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithTitle:name style:UIBarButtonItemStylePlain target:self action:@selector(doLeft:)];
    
    self.navigationItem.leftBarButtonItem = item;
}

- (IBAction)doLeft:(id)sender
{
}

- (IBAction)doLocation:(id)sender
{
}


@end
