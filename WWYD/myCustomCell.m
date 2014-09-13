//
//  myCustomCell.m
//  WWYD
//
//  Created by Simon Orlovsky on 8/19/14.
//  Copyright (c) 2014 simonorlovsky. All rights reserved.
//

#import "myCustomCell.h"

@implementation myCustomCell

- (void)layoutSubviews {
    [super layoutSubviews];
    self.imageView.frame = CGRectMake(0,0,32,32);
}
@end
