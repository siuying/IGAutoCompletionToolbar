//
//  IGAutoCompletionToolbarLayout.h
//  IGAutoCompletionToolbar
//
//  Created by Chong Francis on 13年2月26日.
//  Copyright (c) 2013年 Ignition Soft. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol IGAutoCompletionToolbarLayoutDelegate <UICollectionViewDelegate>
-(CGSize) collectionView:(UICollectionView*)collectionView sizeWithIndex:(NSInteger)index;
@end

@interface IGAutoCompletionToolbarLayout : UICollectionViewLayout

@property (nonatomic) CGFloat padding;
@property (nonatomic) CGFloat spacing;
@property (nonatomic) CGSize contentSize;
@property (strong, nonatomic) NSMutableArray* layoutAttributes;

@end
