/*
 * CalloutView.m
 *
 * This file is a part of the Yandex Map Kit.
 *
 * Version for iOS © 2011-2012 YANDEX
 * 
 * You may not use this file except in compliance with the License.
 * You may obtain a copy of the License at http://legal.yandex.ru/mapkit/
 */

#import "CalloutView.h"

@implementation CalloutView

+ (NSArray *)nibViews {
    UINib *uiNib = [UINib nibWithNibName:@"CalloutView" bundle:nil];
    NSArray *result = [uiNib instantiateWithOwner:nil options:nil];
    
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

@end
