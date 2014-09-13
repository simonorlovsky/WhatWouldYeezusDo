//
//  SecondViewController.m
//  WWYD
//
//  Created by Simon Orlovsky on 8/12/14.
//  Copyright (c) 2014 simonorlovsky. All rights reserved.
//

#import "SecondViewController.h"
#import "SoundModel.h"
#import "myCustomCell.h"

@interface SecondViewController ()
{
    NSArray* _quoteTableData;
    //quotes sounds
    NSArray *_soundFilenamesArray;
}

@end

@implementation SecondViewController

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
    
    
    _soundFilenamesArray= [[[SoundModel alloc] init] getSoundFilenames];
    
    self.quoteTableView.delegate=self;
    self.quoteTableView.dataSource=self;
    _quoteTableData = @[@"quote1", @"quote2", @"quote3", @"quote4", @"quote5", @"quote6", @"quote7", @"quote8"];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)unwindToMainMenu:(UIStoryboardSegue*)sender
{
}

#pragma mark Table Delegate Methods


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSString *cellIdentifier= @"cell";
    //UITableViewCell *cell= [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    myCustomCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        cell = [[myCustomCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    CGSize itemSize = CGSizeMake(40, 40);
    UIGraphicsBeginImageContextWithOptions(itemSize, NO, UIScreen.mainScreen.scale);
    CGRect imageRect = CGRectMake(0.0, 0.0, itemSize.width, itemSize.height);
    [cell.imageView.image drawInRect:imageRect];
    cell.imageView.image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    cell.textLabel.text= _quoteTableData[indexPath.row];
    
    
    NSString *imageName= [NSString stringWithFormat:@"picture%i",indexPath.row+1];
    //cell.imageView.image = [UIImage imageNamed:imageName];
    
    // Configure the cell...
    [cell.imageView setImage:[UIImage imageNamed:imageName]];
        
    return cell;
}



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return _quoteTableData.count;
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString*soundFilename= [NSString stringWithFormat:@"%@",_soundFilenamesArray[indexPath.row]] ;
    //make noise
    NSURL *soundURL= [NSURL URLWithString:soundFilename];
    NSData *soundData= [NSData dataWithContentsOfURL:soundURL];
    NSError *error;
    self.audioPlayer= [[AVAudioPlayer alloc] initWithData:soundData error:&error];
    self.audioPlayer.numberOfLoops=0;
    [self.audioPlayer play];
    NSLog(@"Time: %f",self.audioPlayer.duration);
    NSLog(@"Row selected at row %i",indexPath.row);
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
