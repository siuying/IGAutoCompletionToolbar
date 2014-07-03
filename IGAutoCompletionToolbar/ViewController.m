//
//  ViewController.m
//  IGAutoCompletionToolbar
//
//  Created by Chong Francis on 13年2月26日.
//  Copyright (c) 2013年 Ignition Soft. All rights reserved.
//

#import "ViewController.h"
#import "IGAutoCompletionToolbarCell.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // customization
    [[IGAutoCompletionToolbarCell appearance] setTextColor:[UIColor whiteColor]];
    [[IGAutoCompletionToolbarCell appearance] setHighlightedTextColor:self.view.tintColor];
    [[IGAutoCompletionToolbarCell appearance] setBackgroundColor:self.view.tintColor];
    [[IGAutoCompletionToolbarCell appearance] setHighlightedBackgroundColor:[UIColor whiteColor]];
    [[IGAutoCompletionToolbarCell appearance] setTextFont:[UIFont fontWithName:@"HelveticaNeue" size:14.0]];
    [[IGAutoCompletionToolbarCell appearance] setCornerRadius:14];

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
