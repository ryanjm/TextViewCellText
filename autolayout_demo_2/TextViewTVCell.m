//
//  TextViewTVCell.m
//  autolayout_demo_2
//
//  Created by Philip Loden on 5/9/15.
//  Copyright (c) 2015 Deo Volente LLC. All rights reserved.
//

#import "TextViewTVCell.h"

@implementation TextViewTVCell {
  CGFloat _textViewHeight;
}

- (void)textViewDidChange:(UITextView *)textView {
  CGFloat intrinsicHeight = [textView intrinsicContentSize].height;
  if (_textViewHeight != 0.f && _textViewHeight != intrinsicHeight) {
    [[UIApplication sharedApplication] sendAction:@selector(respondToTextViewHeightDidChange:) to:nil from:self forEvent:nil];
  }
  _textViewHeight = intrinsicHeight;
}

@end
