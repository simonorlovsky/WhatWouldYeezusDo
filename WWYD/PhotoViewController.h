//
//  PhotoViewController.h
//  WWYD
//
//  Created by Simon Orlovsky on 8/16/14.
//  Copyright (c) 2014 simonorlovsky. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PhotoViewController : UIViewController<UIImagePickerControllerDelegate, UINavigationControllerDelegate>

@property (strong, nonatomic) IBOutlet UIImageView *imageView;
- (IBAction)takePhoto:(id)sender;
- (IBAction)choosePhoto:(id)sender;


@end
