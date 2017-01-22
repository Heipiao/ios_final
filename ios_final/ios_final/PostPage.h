//
//  PostPage.h
//  ios_final
//
//  Created by liu on 17/1/21.
//  Copyright © 2017年 liu. All rights reserved.
//

#import "BaseView.h"
#import "PostPage.h"
#import <FirebaseAuth/FirebaseAuth.h>
#import <FirebaseDatabase/FirebaseDatabase.h>
#import <FirebaseStorage/FirebaseStorage.h>
#import <MBProgressHUD.h>
#import "Location.h"

@interface PostPage : BaseView

@property (weak, nonatomic) IBOutlet UITextField *titleTextField;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UITextView *contentTextView;
@property (weak, nonatomic) IBOutlet UILabel *locationlabel;


@property (nonatomic,strong)FIRDatabaseReference * databaseRef;
@property (nonatomic,strong)FIRStorageReference  * storageRef;

- (IBAction)postBtnClick:(id)sender;
@end
