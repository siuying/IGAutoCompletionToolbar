//
//  IGAutoCompletionToolbar.h
//  IGAutoCompletionToolbar
//
//  Created by Chong Francis on 13年2月26日.
//  Copyright (c) 2013年 Ignition Soft. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "IGAutoCompletionToolbarLayout.h"

extern NSString* const IGAutoCompletionToolbarCellID;

@interface IGAutoCompletionToolbar : UICollectionView <UICollectionViewDataSource, UICollectionViewDelegate, IGAutoCompletionToolbarLayoutDelegate>

@property (nonatomic, strong) NSArray* items;
@property (nonatomic, strong) NSMutableArray* filteredItems;

@end
