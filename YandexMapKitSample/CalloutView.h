/*
 * CalloutView.h
 *
 * This file is a part of the Yandex Map Kit.
 *
 * Version for iOS © 2011-2012 YANDEX
 * 
 * You may not use this file except in compliance with the License.
 * You may obtain a copy of the License at http://legal.yandex.ru/mapkit/
 */

#import <UIKit/UIKit.h>
#import "YandexMapKit.h"

@interface CalloutView : UIView <YMKCalloutContentView>

@property (nonatomic, retain) UILabel * titleLabel;
@property (nonatomic, retain) UILabel * subtitleLabel;

+ (CalloutView *)loadView;
- (void)setHighlighted:(BOOL)highlighted;

@end
