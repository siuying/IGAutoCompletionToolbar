//
//  IGAutoCompletionToolbarMacros.h
//  IGAutoCompletionToolbar
//
//  Created by Chong Francis on 13年2月26日.
//  Copyright (c) 2013年 Ignition Soft. All rights reserved.
//

#import <Foundation/Foundation.h>

#ifdef IG_TOOLBAR_IOS5
#define IGCollectionView PSUICollectionView
#define IGCollectionViewCell PSUICollectionViewCell
#define IGCollectionViewDataSource PSUICollectionViewDataSource
#define IGCollectionViewDelegate PSUICollectionViewDelegate
#else
#define IGCollectionView UICollectionView
#define IGCollectionViewCell UICollectionViewCell
#define IGCollectionViewDataSource UICollectionViewDataSource
#define IGCollectionViewDelegate UICollectionViewDelegate
#endif