//
//  ViewController.h
//  IGAutoCompletionToolbar
//
//  Created by Chong Francis on 13年2月26日.
//  Copyright (c) 2013年 Ignition Soft. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "IGAutoCompletionToolbar.h"

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *textfield;
@property (strong, nonatomic) IBOutlet IGAutoCompletionToolbar *toolbar;

@end
