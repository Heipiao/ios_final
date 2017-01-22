//
//  PostPage.m
//  ios_final
//
//  Created by liu on 17/1/21.
//  Copyright © 2017年 liu. All rights reserved.
//

#import "PostPage.h"


@interface PostPage () <UIImagePickerControllerDelegate,UINavigationControllerDelegate,FxLocationDelegate>{

Location *_location;

}
@end

@implementation PostPage

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNavBarImage];
    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(imageDidTap)];
    self.imageView.userInteractionEnabled = YES;
    [self.imageView addGestureRecognizer:tap];
    
    
    [self reloadLocation];
    [self.locationlabel setHidden:YES];
   // [self didLocationAddress];
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
    [self.locationlabel setText:address];
     [self.locationlabel setHidden:NO];
}

-(void) didLocationCity:(NSString *)cityName
{
    
    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
    
    
}
- (IBAction)postBtnClick:(id)sender {
    //NSLog(@"post touched");
    NSString * title= self.titleTextField.text;
    NSString * content = self.contentTextView.text;
    UIImage  * image   = self.imageView.image;
    if (title == nil || content == nil || image == nil) {
        NSLog(@"nil");
        return;
    }

    NSData * imageData = UIImageJPEGRepresentation(image, 1);

    NSTimeInterval timeinterval = [[NSDate  date]timeIntervalSince1970];

    FIRStorageReference * picRef = [self.storageRef child:[NSString stringWithFormat:@"%lf",timeinterval]];

    MBProgressHUD * hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
 
    FIRStorageUploadTask * dataTask = [picRef putData:imageData];
 
    [dataTask observeStatus:FIRStorageTaskStatusProgress handler:^(FIRStorageTaskSnapshot * _Nonnull snapshot) {
        if (snapshot.status == FIRStorageTaskStatusResume) {
            hud.mode = MBProgressHUDModeAnnularDeterminate;//progress bar
            hud.label.text = @"uploading...";
            hud.progress = 0;
        }
        float progress = (float)snapshot.progress.completedUnitCount / (float)snapshot.progress.totalUnitCount;
        hud.progress = progress;//
    }];

    [dataTask observeStatus:FIRStorageTaskStatusFailure handler:^(FIRStorageTaskSnapshot * _Nonnull snapshot) {
        hud.mode = MBProgressHUDModeText;
        hud.label.text = snapshot.error.localizedDescription;
        [hud hideAnimated:YES afterDelay:2];
    }];
    __weak typeof(self) weakSelf = self;
 
    NSString * contentHTMLPath = [[NSBundle mainBundle]pathForResource:@"Content" ofType:@"html"];
    NSError * error = nil;
    NSString * contentHTMLString = [NSString stringWithContentsOfFile:contentHTMLPath
                                                             encoding:NSUTF8StringEncoding
                                                                error:&error];

    [dataTask observeStatus:FIRStorageTaskStatusSuccess handler:^(FIRStorageTaskSnapshot * _Nonnull snapshot) {
        hud.mode = MBProgressHUDModeIndeterminate;
        hud.label.text = @"posting...";
  \
        
        NSString * perfectHTMLString = [[[contentHTMLString stringByReplacingOccurrencesOfString:@"$$title" withString:title]
                                         stringByReplacingOccurrencesOfString:@"$$imageurl" withString:snapshot.metadata.downloadURL.absoluteString]
                                        stringByReplacingOccurrencesOfString:@"$$content" withString:content];
  
        FIRDatabaseReference * childRef =  self.databaseRef.childByAutoId;
        [childRef setValue:@{@"topicTitle"    : title,//title
                             @"topicImageURL" : snapshot.metadata.downloadURL.absoluteString,//pic url
                             @"topicDesc"     : content,//content
                             @"topicHtml"     : perfectHTMLString,
                             @"auth"          : [[FIRAuth auth] currentUser].email,//auth
                             @"createdate"    : @([[NSDate date]timeIntervalSince1970])}//date
               andPriority:@"createdate"//
       withCompletionBlock:^(NSError * _Nullable error, FIRDatabaseReference * _Nonnull ref) {
           hud.mode = MBProgressHUDModeText;//
           if (error) {
               hud.label.text = error.localizedDescription;
           }
           else{
               hud.label.text = @"sucessful";
           }
           [hud hideAnimated:YES afterDelay:2];
           dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
               [weakSelf.navigationController popViewControllerAnimated:YES];
           });
       }];
        
    }];
}


-(void)imageDidTap{
    UIImagePickerController * imagePickerController = [[UIImagePickerController alloc]init];
    imagePickerController.delegate = self;
    [self presentViewController:imagePickerController animated:YES completion:nil];
}
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info{
    UIImage * pickedImage = info[UIImagePickerControllerOriginalImage];
    [picker dismissViewControllerAnimated:YES completion:^{
        self.imageView.image = pickedImage;
    }];
}
- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker{
    [picker dismissViewControllerAnimated:YES completion:nil];
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
}



-(FIRStorageReference *)storageRef{
    if (!_storageRef) {
        _storageRef = [[FIRStorage storage]referenceForURL:@"gs://test-f4b81.appspot.com/image"];
    }
    return _storageRef;
}

-(FIRDatabaseReference *)databaseRef{
    if (!_databaseRef) {
        _databaseRef = [[FIRDatabase database] referenceFromURL:@"https://test-f4b81.firebaseio.com/"];
    }
    return _databaseRef;
}


@end
