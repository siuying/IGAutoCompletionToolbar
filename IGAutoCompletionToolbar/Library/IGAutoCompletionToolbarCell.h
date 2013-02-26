//
//  IGAutoCompletionToolbarCell.h
//  IGAutoCompletionToolbar
//
//  Created by Chong Francis on 13年2月26日.
//  Copyright (c) 2013年 Ignition Soft. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

#import "IGAutoCompletionToolbarMacros.h"

@interface IGAutoCompletionToolbarCell : IGCollectionViewCell

@property (strong, nonatomic) UILabel* textLabel;
@property (strong, nonatomic) CALayer* gradientLayer;
@property (strong, nonatomic) CALayer* selectedGradientLayer;

@end
