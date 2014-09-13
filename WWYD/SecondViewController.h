//
//  SecondViewController.h
//  WWYD
//
//  Created by Simon Orlovsky on 8/12/14.
//  Copyright (c) 2014 simonorlovsky. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

@interface SecondViewController : UIViewController<UITableViewDelegate, UITableViewDataSource>

@property (strong, nonatomic) IBOutlet UITableView *quoteTableView;
@property (nonatomic, strong) AVAudioPlayer *audioPlayer;

@end
