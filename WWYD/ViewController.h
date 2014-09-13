//
//  ViewController.h
//  WWYD
//
//  Created by Simon Orlovsky on 8/7/14.
//  Copyright (c) 2014 simonorlovsky. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

@interface ViewController : UIViewController

@property (strong, nonatomic) IBOutlet UILabel *titleLabel;
@property (strong, nonatomic) IBOutlet UIImageView *imageView;
@property (strong, nonatomic) IBOutlet UIButton *buttonLabel;
@property (nonatomic, strong) AVAudioPlayer *audioPlayer;

@end
