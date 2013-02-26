//
//  IGAutoCompletionToolbar.m
//  IGAutoCompletionToolbar
//
//  Created by Chong Francis on 13年2月26日.
//  Copyright (c) 2013年 Ignition Soft. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>

#import "IGAutoCompletionToolbar.h"
#import "IGAutoCompletionToolbarCell.h"
#import "IGAutoCompletionToolbarLayout.h"

#define MAX_LABEL_WIDTH 280.0

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

        CAGradientLayer* gradient = [CAGradientLayer layer];
        UIColor * highColor = [UIColor colorWithRed:0.627 green:0.627 blue:0.627 alpha:1];
        UIColor * lowColor = [UIColor colorWithRed:0.322 green:0.361 blue:0.412 alpha:1];
        gradient.frame = self.bounds;
        gradient.colors = @[(id)[highColor CGColor],
                            (id)[lowColor CGColor]];
        self.backgroundView = [[UIView alloc] initWithFrame:self.bounds];
        [self.backgroundView.layer addSublayer:gradient];
        
        self.showsHorizontalScrollIndicator = NO;
        self.showsVerticalScrollIndicator = NO;
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
    CGSize size = [title sizeWithFont:[UIFont fontWithName:@"HelveticaNeue" size:13.0]
                    constrainedToSize:CGSizeMake(MAX_LABEL_WIDTH, 32.0)];
    return CGSizeMake(size.width + 14.0, 32);
}

#pragma mark - UICollectionViewDelegate

- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
    return NO;
}

@end
