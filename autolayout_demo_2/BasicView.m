//
//  BasicView.m
//  autolayout_demo_2
//
//  Created by Ryan Mathews on 5/26/15.
//  Copyright (c) 2015 Deo Volente LLC. All rights reserved.
//

#import "BasicView.h"

@implementation BasicView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (CGSize)intrinsicContentSize
{
    return CGSizeMake(45, 30);
}

@end
