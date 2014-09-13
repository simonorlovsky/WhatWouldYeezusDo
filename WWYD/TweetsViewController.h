//
//  TweetsViewController.h
//  WWYD
//
//  Created by Simon Orlovsky on 8/20/14.
//  Copyright (c) 2014 simonorlovsky. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TweetsViewController : UIViewController<UITableViewDelegate, UITableViewDataSource>

@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NSMutableArray *twitterFeed;


@end
