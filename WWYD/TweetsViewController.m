//
//  TweetsViewController.m
//  WWYD
//
//  Created by Simon Orlovsky on 8/20/14.
//  Copyright (c) 2014 simonorlovsky. All rights reserved.
//

#import "TweetsViewController.h"
#import "STTwitter.h"

@implementation TweetsViewController

-(void) viewDidLoad{
    [super viewDidLoad];
    STTwitterAPI *twitter= [STTwitterAPI twitterAPIAppOnlyWithConsumerKey:@"bXJtiGaTVI4d4IhSagFzzBjUN" consumerSecret:@"8FiC471C5OoAkUM5hcznzUdElXv8qJwuDJBYou0WHOM7fvv8Yk"];
    [twitter verifyCredentialsWithSuccessBlock:^(NSString *bearerToken) {
        
        [twitter getUserTimelineWithScreenName:@"whatwouldyeezus"
                                  successBlock:^(NSArray *statuses) {
                                      
                                      self.twitterFeed = [NSMutableArray arrayWithArray:statuses];
                                      
                                      [self.tableView reloadData];
                                      
                                  } errorBlock:^(NSError *error) {
                                      
                                      NSLog(@"%@", error.debugDescription);
                                      
                                  }];
        
    } errorBlock:^(NSError *error) {
        
        NSLog(@"%@", error.debugDescription);
        
    }];
    
}

#pragma mark Table View Methods

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.twitterFeed.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellID =  @"cell" ;
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    
    NSInteger idx = indexPath.row;
    NSDictionary *t = self.twitterFeed[idx];
    
    cell.textLabel.text = t[@"text"];
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}


@end
