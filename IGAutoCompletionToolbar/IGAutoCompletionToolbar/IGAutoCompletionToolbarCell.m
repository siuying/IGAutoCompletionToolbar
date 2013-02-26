//
//  IGAutoCompletionToolbarCell.m
//  IGAutoCompletionToolbar
//
//  Created by Chong Francis on 13年2月26日.
//  Copyright (c) 2013年 Ignition Soft. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>

#import "IGAutoCompletionToolbarCell.h"

@implementation IGAutoCompletionToolbarCell

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.selected = NO;
        self.textLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
        self.textLabel.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
        self.textLabel.font = [UIFont fontWithName:@"HelveticaNeue" size:13.0];
        self.textLabel.textAlignment = NSTextAlignmentCenter;
        self.textLabel.backgroundColor = [UIColor clearColor];
        [self.contentView addSubview:self.textLabel];

        //turning off bounds clipping allows the shadow to extend beyond the rect of the view
        [self setClipsToBounds:NO];
        
        //set the shadow on the view's layer
        [[self layer] setShadowColor:[[UIColor blackColor] CGColor]];
        [[self layer] setShadowOffset:CGSizeMake(0, 1)];
        [[self layer] setShadowOpacity:0.6];
        [[self layer] setShadowRadius:1.0];
        
        self.backgroundView = [[UIView alloc] initWithFrame:self.bounds];
        self.selectedBackgroundView = [[UIView alloc] initWithFrame:self.bounds];
        self.selectedBackgroundView.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.3];
    }
    return self;
}

-(void) prepareForReuse {
    self.textLabel.text = nil;
}

-(void) setObject:(id)object
{
    NSString* title = (NSString*) object;
    self.textLabel.text = title;
    [self setupSublayers];
    [self setNeedsLayout];
}

#pragma mark - Sublayers

-(void) setupSublayers {
    // backgrounds
    UIColor * highColor = [UIColor colorWithWhite:1.000 alpha:1.000];
    UIColor * lowColor = [UIColor colorWithRed:0.851 green:0.859 blue:0.867 alpha:1.000];
    
    CAGradientLayer * gradient = [CAGradientLayer layer];
    [gradient setFrame:[self bounds]];
    [gradient setColors:[NSArray arrayWithObjects:(id)[highColor CGColor], (id)[lowColor CGColor], nil]];
    
    CALayer * roundRect = [CALayer layer];
    [roundRect setFrame:[self bounds]];
    [roundRect setCornerRadius:6.0f];
    [roundRect setMasksToBounds:YES];
    [roundRect addSublayer:gradient];
    
    [[self.backgroundView layer] insertSublayer:roundRect atIndex:0];
    if (self.bgLayer) {
        [self.backgroundView.layer replaceSublayer:self.bgLayer with:roundRect];
    }
    self.bgLayer = roundRect;
}

@end
