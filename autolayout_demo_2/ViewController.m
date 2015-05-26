//
//  ViewController.m
//  autolayout_demo_2
//
//  Created by Philip Loden on 5/9/15.
//  Copyright (c) 2015 Deo Volente LLC. All rights reserved.
//

#import "ViewController.h"
#import "TextViewTVCell.h"

@interface Comment : NSObject

@property (nonatomic, strong) NSString *author;
@property (nonatomic, strong) NSString *body;

@end

@implementation Comment

@end


@interface CommentTVCell : UITableViewCell

@property (nonatomic, strong) IBOutlet UILabel *authorLabel;
@property (nonatomic, strong) IBOutlet UILabel *bodyLabel;

@end

@implementation CommentTVCell

@end


@interface ViewController ()

@property (nonatomic, strong) NSArray *comments;
@property (nonatomic, strong) IBOutlet UITableView *tableView;
@property (nonatomic, strong) TextViewTVCell *prototypeCell;
@property (nonatomic, strong) NSString *myComment;

@end

@implementation ViewController

- (void)viewDidLoad {
    self.myComment = @"This is a test. Hello world. Test and this is a good alknd a ldkj alkj adsfkj asdflkj test.";
  [super viewDidLoad];
}

- (TextViewTVCell *)prototypeCell
{
    if (!_prototypeCell) {
        _prototypeCell = [self.tableView dequeueReusableCellWithIdentifier:NSStringFromClass([TextViewTVCell class])];
    }
    return _prototypeCell;
}


#pragma mark - UITableView

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
  return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//  if (section == 0) {
    return 1;
//  } else {
//    return self.comments.count;
//  }
}

- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath {
  return 44.0f;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
//  return UITableViewAutomaticDimension;

//    self.prototypeCell.bounds = CGRectMake(0.0f, 0.0f, CGRectGetWidth(self.tableView.bounds), CGRectGetHeight(self.prototypeCell.bounds));

    self.prototypeCell.textView.text = self.myComment;
    
    [self.prototypeCell.contentView setNeedsLayout];
    [self.prototypeCell.contentView layoutIfNeeded];
    
    CGSize size = [self.prototypeCell.contentView systemLayoutSizeFittingSize:UILayoutFittingCompressedSize];

    NSLog(@"calculated size for cell: %@", NSStringFromCGSize(size));
    return size.height + 7;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
//  if (indexPath.section == 0) {
    TextViewTVCell *tvc = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([TextViewTVCell class])];
    
    tvc.textView.text = self.myComment;
//    [tvc setNeedsLayout];
    
    return tvc;
//  }
//  else {
//    CommentTVCell *tvc = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([CommentTVCell class])];
//    
//    Comment *comment = self.comments[indexPath.row];
//    tvc.authorLabel.text = comment.author;
//    tvc.bodyLabel.text = comment.body;
//    
//    return tvc;
//  }
}

- (NSArray *)comments {
  if ( ! _comments ) {
    Comment *c1 = [Comment new];
    c1.author = @"Phil";
    c1.body = @"Phil says something here.";
    
    Comment *c2 = [Comment new];
    c2.author = @"Tom";
    c2.body = @"Tom says something here.\nAnd another line of something here.";
    
    Comment *c3 = [Comment new];
    c3.author = @"Matt";
    c3.body = @"Matt says something here.\nAnd another line of something here.\nAnd another line of something here.\n\nAnd another line of something here.";
    
    _comments = @[c1, c2, c3];
  }
  return _comments;
}

- (void)respondToTextViewHeightDidChange:(TextViewTVCell *)tvc {
    self.myComment = tvc.textView.text;
  [self.tableView beginUpdates];
  [self.tableView endUpdates];
}

@end
