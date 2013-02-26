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
        [self setClipsToBounds:NO];
        
        //set the shadow on the view's layer
        [[self layer] setShadowColor:[[UIColor blackColor] CGColor]];
        [[self layer] setShadowOffset:CGSizeMake(0, 1)];
        [[self layer] setShadowOpacity:0.6];
        [[self layer] setShadowRadius:1.0];
        
        self.backgroundView = [[UIView alloc] initWithFrame:self.bounds];
        self.selectedBackgroundView = [[UIView alloc] initWithFrame:self.bounds];
        [self setupSublayers];

    }
    return self;
}

-(void) prepareForReuse {
    [super prepareForReuse];
    self.textLabel.text = nil;
}

-(void) setObject:(id)object
{
    NSString* title = (NSString*) object;
    self.textLabel.text = title;
    [self setNeedsLayout];
}

-(void) layoutSubviews {
    [super layoutSubviews];
    [self setupSublayers];
}

#pragma mark - Sublayers

-(void) setupSublayers {
    // backgrounds
    UIColor * highColor = [UIColor colorWithWhite:1.000 alpha:1.000];
    UIColor * lowColor = [UIColor colorWithRed:0.851 green:0.859 blue:0.867 alpha:1.000];
    
    CAGradientLayer * gradient = [CAGradientLayer layer];
    [gradient setFrame:[self bounds]];
    [gradient setColors:@[(id)[highColor CGColor], (id)[lowColor CGColor]]];
    
    CALayer * roundRect = [CALayer layer];
    [roundRect setFrame:[self bounds]];
    [roundRect setCornerRadius:6.0f];
    [roundRect setMasksToBounds:YES];
    [roundRect addSublayer:gradient];
    if (self.gradientLayer) {
        [self.gradientLayer removeFromSuperlayer];
    }
    [self.backgroundView.layer insertSublayer:roundRect atIndex:0];
    self.gradientLayer = roundRect;

    CAGradientLayer * gradient2 = [CAGradientLayer layer];
    [gradient2 setFrame:[self bounds]];
    [gradient2 setColors:@[(id)[lowColor CGColor], (id)[highColor CGColor]]];
    
    CALayer * roundRect2 = [CALayer layer];
    [roundRect2 setFrame:[self bounds]];
    [roundRect2 setCornerRadius:6.0f];
    [roundRect2 setMasksToBounds:YES];
    if (self.selectedGradientLayer) {
        [self.selectedGradientLayer removeFromSuperlayer];
    }
    [roundRect2 addSublayer:gradient2];
    [self.selectedBackgroundView.layer insertSublayer:roundRect2 atIndex:0];
    self.selectedGradientLayer = roundRect2;
}

@end
