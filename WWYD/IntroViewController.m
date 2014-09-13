//
//  IntroViewController.m
//  WWYD
//
//  Created by Simon Orlovsky on 8/8/14.
//  Copyright (c) 2014 simonorlovsky. All rights reserved.
//

#import "IntroViewController.h"
#import <Social/Social.h>

@interface IntroViewController ()

@end

@implementation IntroViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self)
    {
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //add swipe recognizer to view
    self.navigationController.navigationBar.barTintColor = [UIColor blackColor];
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor whiteColor]}];
    [self.navigationController.navigationBar setTitleTextAttributes:
     [NSDictionary dictionaryWithObjectsAndKeys:
      [UIFont fontWithName:@"Bebas Neue" size:21],
      NSFontAttributeName, nil]];
    self.navigationController.navigationBar.translucent = YES;
    
    self.navigationController.navigationBar.barStyle = UIBarStyleBlack;
    
    // your text attributes dictionary
       
//    UISwipeGestureRecognizer *swipeRecognizer= [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(swipeRecognized:)];
//    swipeRecognizer.direction= UISwipeGestureRecognizerDirectionLeft;
//    [self.view addGestureRecognizer:swipeRecognizer];
//    
//    //add swipe gesture for right
//    UISwipeGestureRecognizer *rightSwipeRecognizer= [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(swipeRecognized:)];
//    rightSwipeRecognizer.direction= UISwipeGestureRecognizerDirectionRight;
//    [self.view addGestureRecognizer:rightSwipeRecognizer];
//    
//    //add swipe gesture for up
//    UISwipeGestureRecognizer *upSwipeRecognizer= [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(swipeRecognized:)];
//    upSwipeRecognizer.direction= UISwipeGestureRecognizerDirectionUp;
//    [self.view addGestureRecognizer:upSwipeRecognizer];
//    
//    //add swipe gesture for down
//    UISwipeGestureRecognizer *downSwipeRecognizer= [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(swipeRecognized:)];
//    downSwipeRecognizer.direction= UISwipeGestureRecognizerDirectionDown;
//    [self.view addGestureRecognizer:downSwipeRecognizer];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (void)showTweetSheet
{
    //  Create an instance of the Tweet Sheet
    SLComposeViewController *tweetSheet = [SLComposeViewController
                                           composeViewControllerForServiceType:
                                           SLServiceTypeTwitter];
    
    // Sets the completion handler.  Note that we don't know which thread the
    // block will be called on, so we need to ensure that any required UI
    // updates occur on the main queue
    tweetSheet.completionHandler = ^(SLComposeViewControllerResult result) {
        switch(result) {
                //  This means the user cancelled without sending the Tweet
            case SLComposeViewControllerResultCancelled:
                break;
                //  This means the user hit 'Send'
            case SLComposeViewControllerResultDone:
                break;
        }
    };
    
    //  Set the initial body of the Tweet
    [tweetSheet setInitialText:@"#WhatWouldYeezusDo"];
    
    //  Adds an image to the Tweet.  For demo purposes, assume we have an
    //  image named 'larry.png' that we wish to attach
    if (![tweetSheet addImage:[UIImage imageNamed:@"larry.png"]]) {
        NSLog(@"Unable to add the image!");
    }
    
    //  Add an URL to the Tweet.  You can add multiple URLs.
    if (![tweetSheet addURL:[NSURL URLWithString:@"http://twitter.com/"]]){
        NSLog(@"Unable to add the URL!");
    }
    
    //  Presents the Tweet Sheet to the user
    [self presentViewController:tweetSheet animated:NO completion:^{
        NSLog(@"Tweet sheet has been presented.");
    }];
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
