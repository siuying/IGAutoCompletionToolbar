//
//  IGAutoCompletionToolbar.m
//  IGAutoCompletionToolbar
//
//  Created by Chong Francis on 13年2月26日.
//  Copyright (c) 2013年 Ignition Soft. All rights reserved.
//

#import "IGAutoCompletionToolbar.h"
#import "IGAutoCompletionToolbarCell.h"
#import "IGAutoCompletionToolbarLayout.h"

#define MAX_LABEL_WIDTH 200.0

NSString* const IGAutoCompletionToolbarCellID = @"IGAutoCompletionToolbarCellID";

@implementation IGAutoCompletionToolbar

-(id) initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame collectionViewLayout:[[IGAutoCompletionToolbarLayout alloc] init]];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        self.items = [NSArray array];
        self.filteredItems = [NSMutableArray array];
        [self registerClass:[IGAutoCompletionToolbarCell class]
 forCellWithReuseIdentifier:IGAutoCompletionToolbarCellID];

        self.filteredItems = @[@"Note", @"Test", @"Clip", @"Haha World", @"Aceeepeepe", @"Dictor", @"Mooo", @"Hahoom"].mutableCopy;
        self.dataSource = self;
        self.delegate = self;
    }

    return self;
}

#pragma mark - UICollectionViewDataSource

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    if (section == 0) {
        return [self.filteredItems count];
    } else {
        return 0;
    }
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    id object = [self.filteredItems objectAtIndex:[indexPath row]];
    IGAutoCompletionToolbarCell* cell = [self dequeueReusableCellWithReuseIdentifier:IGAutoCompletionToolbarCellID
                                                                        forIndexPath:indexPath];
    [cell setObject:object];
    [cell setNeedsLayout];
    return cell;
}

#pragma mark - IGAutoCompletionToolbarLayout

-(CGSize) collectionView:(UICollectionView*)collectionView sizeWithIndex:(NSInteger)index {
    id object = [self.filteredItems objectAtIndex:index];
    NSString* title = object;
    CGSize size = [title sizeWithFont:[UIFont fontWithName:@"HelveticaNeue" size:14.0]
                    constrainedToSize:CGSizeMake(MAX_LABEL_WIDTH, 32.0)];
    return CGSizeMake(size.width + 8.0, 32);
}

#pragma mark - UICollectionViewDelegate

- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
    return NO;
}

@end
