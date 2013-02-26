//
//  IGAutoCompletionToolbarLayout.h
//  IGAutoCompletionToolbar
//
//  Created by Chong Francis on 13年2月26日.
//  Copyright (c) 2013年 Ignition Soft. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "IGAutoCompletionToolbarMacros.h"

@protocol IGAutoCompletionToolbarLayoutDelegate <IGCollectionViewDelegate>
-(CGSize) collectionView:(IGCollectionView*)collectionView sizeWithIndex:(NSInteger)index;
@end

@interface IGAutoCompletionToolbarLayout : IGCollectionViewLayout

@property (nonatomic) CGFloat padding;
@property (nonatomic) CGFloat spacing;
@property (nonatomic) CGSize contentSize;
@property (strong, nonatomic) NSMutableArray* layoutAttributes;

@end
