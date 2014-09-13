//
//  TweetViewController.h
//  WWYD
//
//  Created by Simon Orlovsky on 8/19/14.
//  Copyright (c) 2014 simonorlovsky. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TweetViewController : UIViewController<UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) IBOutlet UITableView *tableView;

@end
