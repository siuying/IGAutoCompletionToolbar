//
//  IGAutoCompletionToolbarCell.m
//  IGAutoCompletionToolbar
//
//  Created by Chong Francis on 13年2月26日.
//  Copyright (c) 2013年 Ignition Soft. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>

#import "IGAutoCompletionToolbarCell.h"

@interface IGAutoCompletionToolbarCell()
@property (strong, nonatomic) UILabel* textLabel;
@end

@implementation IGAutoCompletionToolbarCell

+(void) initialize {
    [[self appearance] setTextFont:[UIFont fontWithName:@"HelveticaNeue" size:13.0]];
    [[self appearance] setTextColor:[UIColor blueColor]];
    [[self appearance] setHighlightedTextColor:[UIColor lightTextColor]];
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.selected = NO;

        self.textLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
        self.textLabel.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
        self.textLabel.textAlignment = NSTextAlignmentCenter;
        self.textLabel.backgroundColor = [UIColor clearColor];

        self.textLabel.font = [[[self class] appearance] textFont];
        self.textLabel.textColor = [[[self class] appearance] textColor];
        self.textLabel.highlightedTextColor = [[[self class] appearance] highlightedTextColor];

        [self.contentView addSubview:self.textLabel];
    }
    return self;
}

-(void) prepareForReuse {
    [super prepareForReuse];
    self.textLabel.text = nil;
}

@end
