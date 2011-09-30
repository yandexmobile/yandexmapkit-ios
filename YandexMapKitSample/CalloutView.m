//
//  CalloutView.m
//  YandexMapKitSample
//
//  Created by Roman Busyghin on 9/18/11.
//  Copyright 2011 Яндекс. All rights reserved.
//

#import "CalloutView.h"

@interface CalloutView ()

@end

@implementation CalloutView

+ (CalloutView *)loadView {
    UINib * calloutViewNib = [UINib nibWithNibName:@"CalloutView" bundle:nil];
    NSArray * nibViews =  [calloutViewNib instantiateWithOwner:nil options:nil];
    for (id v in nibViews) {
        if ([v isKindOfClass:[self class]]) {
            [v setBackgroundColor:[UIColor clearColor]];
            return v;
        }
    }
    NSAssert(NO, @"Can't load CalloutView from nib");
    return nil;
}

- (void)setHighlighted:(BOOL)highlighted {
    self.titleLabel.highlighted = highlighted;
    self.subtitleLabel.highlighted = highlighted;
}

#pragma mark - Properties

@synthesize titleLabel;
@synthesize subtitleLabel;

#pragma mark - Memory Management

- (void)dealloc {
    self.titleLabel = nil;
    self.subtitleLabel = nil;
    
    [super dealloc];
}

@end
