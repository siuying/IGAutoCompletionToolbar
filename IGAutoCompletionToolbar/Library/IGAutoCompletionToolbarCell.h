//
//  IGAutoCompletionToolbarCell.h
//  IGAutoCompletionToolbar
//
//  Created by Chong Francis on 13年2月26日.
//  Copyright (c) 2013年 Ignition Soft. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

@interface IGAutoCompletionToolbarCell : UICollectionViewCell

@property (nonatomic, strong) UIColor* textColor UI_APPEARANCE_SELECTOR;
@property (nonatomic, assign) UIColor* backgroundColor UI_APPEARANCE_SELECTOR;

@property (nonatomic, strong) UIFont* textFont UI_APPEARANCE_SELECTOR;
@property (nonatomic, assign) CGFloat cornerRadius UI_APPEARANCE_SELECTOR;

@property (nonatomic, strong) UIColor* highlightedTextColor UI_APPEARANCE_SELECTOR;
@property (nonatomic, assign) UIColor* highlightedBackgroundColor UI_APPEARANCE_SELECTOR;

@property (readonly, nonatomic) UILabel* textLabel;

@end
