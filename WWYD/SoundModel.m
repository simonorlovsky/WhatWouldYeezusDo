//
//  SoundModel.m
//  WWYD
//
//  Created by Simon Orlovsky on 8/8/14.
//  Copyright (c) 2014 simonorlovsky. All rights reserved.
//

#import "SoundModel.h"

@implementation SoundModel

-(NSArray*)getSoundFilenames{
    //fetch sound plist locally
    /*NSString *plistPath= [[NSBundle mainBundle] pathForResource:@"Sounds" ofType:@"plist"];
    NSMutableDictionary *plistDictionary=[[NSMutableDictionary alloc] initWithContentsOfFile:plistPath];
     */
    
    //fetch sound plist via network
    NSURL *url= [NSURL URLWithString:@"http://simonorlovsky.com/Projects/WWYS/Sounds.plist"];
    NSMutableDictionary *plistDictionary= [[NSMutableDictionary alloc] initWithContentsOfURL:url];
    
    NSArray *soundsFilenamesArray = plistDictionary[@"Sounds"];
    return soundsFilenamesArray;
}

@end
