//
//  IGAutoCompletionToolbarLayout.m
//  IGAutoCompletionToolbar
//
//  Created by Chong Francis on 13年2月26日.
//  Copyright (c) 2013年 Ignition Soft. All rights reserved.
//

#import "IGAutoCompletionToolbarLayout.h"
#import <math.h>

@implementation IGAutoCompletionToolbarLayout

-(id) init {
    self = [super init];
    if (self) {
        self.padding = 6.0;
        self.spacing = 10.0;
    }
    return self;
}

- (void)invalidateLayout {
    [super invalidateLayout];

    self.layoutAttributes = nil;
    [self layout];
}

- (NSArray*) layoutAttributesForElementsInRect:(CGRect)rect
{
    if (!self.layoutAttributes) {
        [self layout];
    }

    NSPredicate *predicate = [NSPredicate predicateWithBlock:^BOOL(id evaluatedObject,NSDictionary* bindings) {
        UICollectionViewLayoutAttributes* layoutAttributes = evaluatedObject;
        CGRect cellFrame = layoutAttributes.frame;
        return CGRectIntersectsRect(cellFrame,rect);
    }];

    NSArray* filteredLayoutAttributes = [self.layoutAttributes filteredArrayUsingPredicate:predicate];
    return filteredLayoutAttributes;
}

- (UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (!self.layoutAttributes) {
        [self layout];
    }
    return [self.layoutAttributes objectAtIndex:[indexPath row]];
}

- (CGSize)collectionViewContentSize {
    return self.contentSize;
}

- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds
{
    return NO;
}

#pragma mark - Private

-(void) layout {
    id<IGAutoCompletionToolbarLayoutDelegate> delegate = (id<IGAutoCompletionToolbarLayoutDelegate>) self.collectionView.delegate;
    NSMutableArray* newLayoutAttributes = [NSMutableArray array];
    NSInteger numberOfItems = [self.collectionView.dataSource collectionView:self.collectionView numberOfItemsInSection:0];
    CGFloat offset = 0.0;
    CGFloat height = self.collectionView.frame.size.height - 2 * self.padding;

    for (NSInteger i = 0; i < numberOfItems; i ++) {
        CGSize size = [delegate collectionView:self.collectionView sizeWithIndex:i];
        UICollectionViewLayoutAttributes* attr = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:[NSIndexPath indexPathForRow:i inSection:0]];
        attr.frame = CGRectMake(ceilf(self.spacing + offset), ceilf(self.padding), ceilf(size.width), ceilf(height));
        [newLayoutAttributes addObject:attr];
        offset = size.width + self.padding + offset;
    }

    self.contentSize = CGSizeMake(offset + self.spacing * 2 - self.padding, height);
    self.layoutAttributes = newLayoutAttributes;
}

@end
