//
//  TweetViewController.m
//  WWYD
//
//  Created by Simon Orlovsky on 8/19/14.
//  Copyright (c) 2014 simonorlovsky. All rights reserved.
//

#import "TweetViewController.h"
#import <Social/Social.h>
#import <Accounts/Accounts.h>

@interface TweetViewController ()

@property (strong, nonatomic) NSArray *array;

@end

@implementation TweetViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self twitterTimeline];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)twitterTimeline {
    
    ACAccountStore *account = [[ACAccountStore alloc] init]; // Creates AccountStore object.
    
    // Asks for the Twitter accounts configured on the device.
    
    ACAccountType *accountType = [account accountTypeWithAccountTypeIdentifier:ACAccountTypeIdentifierTwitter];
    
    [account requestAccessToAccountsWithType:accountType options:nil completion:^(BOOL granted, NSError *error)
     {
         // If we have access to the Twitter accounts configured on the device we will contact the Twitter API.
         
         if (granted == YES){
             
             
             NSArray *arrayOfAccounts = [account accountsWithAccountType:accountType]; // Retrieves an array of Twitter accounts configured on the device.
             
             // If there is a leat one account we will contact the Twitter API.
             
             if ([arrayOfAccounts count] > 0) {
                 
                 ACAccount *twitterAccount = [arrayOfAccounts lastObject]; // Sets the last account on the device to the twitterAccount variable.
                 
                 NSURL *requestAPI = [NSURL URLWithString:@"https://api.twitter.com/1.1/statuses/user_timeline.json"]; // API call that returns entires in a user's timeline.
                 
                 // The requestAPI requires us to tell it how much data to return so we use a NSDictionary to set the 'count'.
                 
                 NSMutableDictionary *parameters = [[NSMutableDictionary alloc] init];
                 
                 [parameters setObject:@"100" forKey:@"count"];
                 
                 [parameters setObject:@"1" forKey:@"include_entities"];
                 
                 // This is where we are getting the data using SLRequest.
                 
                 SLRequest *posts = [SLRequest requestForServiceType:SLServiceTypeTwitter requestMethod:SLRequestMethodGET URL:requestAPI parameters:parameters];
                 
                 posts.account = twitterAccount;
                 
                 // The postRequest: method call now accesses the NSData object returned.
                 
                 [posts performRequestWithHandler:
                  
                  ^(NSData *response, NSHTTPURLResponse
                    *urlResponse, NSError *error)
                  {
                      // The NSJSONSerialization class is then used to parse the data returned and assign it to our array.
                      
                      self.array = [NSJSONSerialization JSONObjectWithData:response options:NSJSONReadingMutableLeaves error:&error];
                      
                      if (self.array.count != 0) {
                          
                          dispatch_async(dispatch_get_main_queue(), ^{
                              
                              [self.tableView reloadData]; // Here we tell the table view to reload the data it just recieved.
                              
                          });
                          
                      }
                      
                  }];
                 
             }
             
         } else {
             
             // Handle failure to get account access
             NSLog(@"%@", [error localizedDescription]);
             
         }
         
     }];
    
}

#pragma mark Table View Data Source Mehtods

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    // Returns the number of rows for the table view using the array instance variable.
    
    return [_array count];
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    // Creates each cell for the table view.
    
    static NSString *cellID =  @"CELLID" ;
    
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:cellID];
    
    if (cell == nil) {
        
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
        
    }
    
    // Creates an NSDictionary that holds the user's posts and then loads the data into each cell of the table view.
    
    NSDictionary *tweet = _array[indexPath.row];
    
    cell.textLabel.text = tweet[@"text"];
    cell.textLabel.numberOfLines= 0;
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    // When a user selects a row this will deselect the row.
    
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
    
}

@end