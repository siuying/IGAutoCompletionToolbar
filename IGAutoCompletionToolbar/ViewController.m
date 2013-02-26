//
//  ViewController.m
//  IGAutoCompletionToolbar
//
//  Created by Chong Francis on 13年2月26日.
//  Copyright (c) 2013年 Ignition Soft. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.toolbar = [[IGAutoCompletionToolbar alloc] initWithFrame:CGRectMake(0,0,320,44)];
    self.toolbar.items = @[@"Apple", @"Banana", @"Blueberry", @"Grape", @"Pineapple", @"Orange", @"Pear"];
    self.toolbar.toolbarDelegate = self;

    self.textfield.inputAccessoryView = self.toolbar;
    self.toolbar.textField = self.textfield;
}

#pragma mark - IGAutoCompletionToolbarDelegate

- (void) autoCompletionToolbar:(IGAutoCompletionToolbar*)toolbar didSelectItemWithObject:(id)object {
    NSLog(@"tag selected - %@", object);
}

@end
