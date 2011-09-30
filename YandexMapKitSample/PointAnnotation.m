//
//  PointAnnotation.m
//  YandexMapKitSample
//
//  Created by Roman Busyghin on 9/18/11.
//  Copyright 2011 Яндекс. All rights reserved.
//

#import "PointAnnotation.h"

@implementation PointAnnotation

+ (id)pointAnnotation {
    return [[[[self class] alloc] init] autorelease];
}

@synthesize title;
@synthesize subtitle;
@synthesize coordinate;

@end
