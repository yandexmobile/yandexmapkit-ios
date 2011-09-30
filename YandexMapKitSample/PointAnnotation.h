//
//  PointAnnotation.h
//  YandexMapKitSample
//
//  Created by Roman Busyghin on 9/18/11.
//  Copyright 2011 Яндекс. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YandexMapKit.h"

@interface PointAnnotation : NSObject <YMKAnnotation>

+ (id)pointAnnotation;

@property (nonatomic, copy) NSString * title;
@property (nonatomic, copy) NSString * subtitle;
@property (nonatomic, assign) YMKMapCoordinate coordinate;

@end
