//
//  CalloutView.h
//  YandexMapKitSample
//
//  Created by Roman Busyghin on 9/18/11.
//  Copyright 2011 Яндекс. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YandexMapKit.h"

@interface CalloutView : UIView <YMKCalloutContentView>

@property (nonatomic, retain) UILabel * titleLabel;
@property (nonatomic, retain) UILabel * subtitleLabel;

+ (CalloutView *)loadView;
- (void)setHighlighted:(BOOL)highlighted;

@end
