//
//  BasePage.h
//  ios_final
//
//  Created by liu on 17/1/20.
//  Copyright © 2017年 liu. All rights reserved.
//

#import "BaseView.h"
#import "Defines.h"
#import "PostPage.h"


@interface BasePage : BaseView

- (IBAction)dopost:(id)sender;
- (void)setNavigationLeft:(NSString *)name;
- (void)setNavigationRight;

@end
