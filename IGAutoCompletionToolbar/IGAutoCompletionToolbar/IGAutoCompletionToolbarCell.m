//
//  IGAutoCompletionToolbarCell.m
//  IGAutoCompletionToolbar
//
//  Created by Chong Francis on 13年2月26日.
//  Copyright (c) 2013年 Ignition Soft. All rights reserved.
//

#import "IGAutoCompletionToolbarCell.h"

@implementation IGAutoCompletionToolbarCell

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.textLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
        self.textLabel.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
        self.textLabel.font = [UIFont fontWithName:@"HelveticaNeue" size:14.0];
        self.textLabel.backgroundColor = [UIColor blueColor];
        self.textLabel.textAlignment = NSTextAlignmentCenter;
        [self.contentView addSubview:self.textLabel];
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
    [self setNeedsLayout];
}

@end
