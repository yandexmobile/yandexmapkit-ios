/*
 * CalloutView.m
 *
 * This file is a part of the Yandex Map Kit.
 *
 * Version for iOS © 2011 YANDEX
 * 
 * You may not use this file except in compliance with the License.
 * You may obtain a copy of the License at http://legal.yandex.ru/mapkit/
 */

#import "CalloutView.h"

@interface CalloutView ()

+ (NSArray *)nibViews;

@end


@implementation CalloutView

// Checks whether we can use UINib while running on iOS 3.x as required
// by iOS 4.0 release notes (refer to Interface Builder section of the following
// document: http://developer.apple.com/library/ios/#releasenotes/General/RN-iPhoneSDK-4_0/_index.html )
+ (BOOL)canUseUINib {
    Class uiNibClass = NSClassFromString(@"UINib");
    
    if ([uiNibClass respondsToSelector:@selector(nibWithNibName:bundle:)]) {
        return YES;
    }

    return NO;
}

+ (NSArray *)nibViews {
    NSString * nibName = @"CalloutView";
    NSArray * result = nil;

    if ([self canUseUINib]) {
        UINib * uiNib = [UINib nibWithNibName:nibName bundle:nil];
        result = [uiNib instantiateWithOwner:nil options:nil];
    }
    else {
        result = [[NSBundle mainBundle] loadNibNamed:nibName owner:nil options:nil];
    }
    
    return result;
}

+ (CalloutView *)loadView {
    NSArray * nibViews = [self nibViews];

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
