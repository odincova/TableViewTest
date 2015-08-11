//
//  TextViewController.m
//  DinamicTable
//
//  Created by Juliya on 07.08.15.
//  Copyright (c) 2015 Juliya Odincova. All rights reserved.
//

#import "TextViewController.h"

@interface TextViewController ()
@property (weak, nonatomic) IBOutlet UITextView *textView;
@end

@implementation TextViewController

- (void)setFont:(UIFont *)font {
    _font = font;
    _textView.font = font;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    _textView.font = _font;
}

@end
