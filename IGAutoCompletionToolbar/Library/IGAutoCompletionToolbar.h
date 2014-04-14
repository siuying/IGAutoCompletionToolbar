//
//  IGAutoCompletionToolbar.h
//  IGAutoCompletionToolbar
//
//  Created by Chong Francis on 13年2月26日.
//  Copyright (c) 2013年 Ignition Soft. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

#import "IGAutoCompletionToolbarLayout.h"

extern NSString* const IGAutoCompletionToolbarCellID;

@class IGAutoCompletionToolbar;
@class IGAutoCompletionToolbarCell;

@protocol IGAutoCompletionToolbarDelegate <NSObject>
@optional

// Check if the object should include the object with supplited filter
// by default, filter the object as string, using NSCaseInsensitiveSearch
- (BOOL) autoCompletionToolbar:(IGAutoCompletionToolbar*)toolbar shouldAcceptObject:(id)object withFilter:(NSString*)filter;

// Called when item is selected
- (void) autoCompletionToolbar:(IGAutoCompletionToolbar*)toolbar didSelectItemWithObject:(id)object;

// Setup the IGAutoCompletionToolbarCell with the supplited object
// Use this to customize the cell with any object.
- (void) autoCompletionToolbar:(IGAutoCompletionToolbar*)toolbar setupCell:(IGAutoCompletionToolbarCell*)cell withObject:(id)object;

// Size of the cell with supplied object.
// If you implement autoCompletionToolbar:setupCell:withObject:, you would probably want to implement this.
-(CGSize) autoCompletionToolbar:(IGAutoCompletionToolbar*)toolbar cellSizeWithObject:(id)object;

@end

@interface IGAutoCompletionToolbar : UICollectionView <UICollectionViewDataSource, UICollectionViewDelegate, IGAutoCompletionToolbarLayoutDelegate> {
}

@property (nonatomic, weak) id<IGAutoCompletionToolbarDelegate, NSObject> toolbarDelegate;

// the textfield this auto completion toolbar related to
@property (nonatomic, weak) UITextField* textField;
@property (nonatomic, strong) NSString* filter;
@property (nonatomic, strong) NSArray* items;
@property (nonatomic, strong, readonly) NSMutableArray* filteredItems;

@property (nonatomic, strong) CAGradientLayer* gradientLayer;

@end
