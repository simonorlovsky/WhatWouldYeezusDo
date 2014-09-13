//
//  ViewController.m
//  WWYD
//
//  Created by Simon Orlovsky on 8/7/14.
//  Copyright (c) 2014 simonorlovsky. All rights reserved.
//

#import "ViewController.h"
#import "SoundModel.h"

@interface ViewController ()
{
    NSArray *_quotes;
    //noises
    NSArray *_sounds;
    //quotes sounds
    NSArray *_soundFilenamesArray;
    //counter
    int _counter;
}

@end

@implementation ViewController



- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    _soundFilenamesArray= [[[SoundModel alloc] init] getSoundFilenames];
    
    _quotes = [NSArray arrayWithObjects:@"quote1",@"quote2",@"quote3",@"quote4",@"quote5",@"quote6",@"quote7",@"quote8", nil];
    _sounds = [NSArray arrayWithObjects:@"HAH!",@"HENH?!",@"AHNH!",@"UN HUH..",@"HAH!",@"HANH!",@"HAAH?!", @"HAH.", nil];
    _counter=0;
    self.imageView.layer.cornerRadius = self.imageView.frame.size.width / 2;
    self.imageView.clipsToBounds = YES;
    self.imageView.layer.borderWidth = 3.0f;
    self.imageView.layer.borderColor = [UIColor whiteColor].CGColor;
    

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)buttonClicked:(id)sender
{
    _counter++;
    NSString*soundFilename= [NSString stringWithFormat:@"%@",_soundFilenamesArray[_counter]] ;
    
    //set text for label
    self.titleLabel.text= [NSString stringWithFormat:@"%@",_quotes[_counter]];
    
    //set text for button
    [_buttonLabel setTitle: [NSString stringWithFormat:@"%@",_sounds[_counter]] forState: UIControlStateNormal];
    
    //set image for view
    NSString *imageName= [NSString stringWithFormat:@"picture%i",_counter];
    self.imageView.image= [UIImage imageNamed:imageName];
    

    //make noise
    NSURL *soundURL= [NSURL URLWithString:soundFilename];
    NSData *soundData= [NSData dataWithContentsOfURL:soundURL];
    NSError *error;
    self.audioPlayer= [[AVAudioPlayer alloc] initWithData:soundData error:&error];
    self.audioPlayer.numberOfLoops=0;
    [self.audioPlayer play];
}

@end
