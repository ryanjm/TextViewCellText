//
//  TextViewTVCell.h
//  autolayout_demo_2
//
//  Created by Philip Loden on 5/9/15.
//  Copyright (c) 2015 Deo Volente LLC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TextViewTVCell : UITableViewCell <UITextViewDelegate>

@property (nonatomic, strong) IBOutlet UITextView *textView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *textViewWidthConstraint;

@end
