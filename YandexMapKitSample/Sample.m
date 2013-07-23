/*
 * Sample.m
 *
 * This file is a part of the Yandex Map Kit.
 *
 * Version for iOS © 2011-2013 YANDEX
 *
 * You may not use this file except in compliance with the License.
 * You may obtain a copy of the License at http://legal.yandex.ru/mapkit/
 */

#import "Sample.h"

@interface Sample ()

@property (nonatomic, readwrite, copy) NSString * title;
@property (nonatomic, readwrite, copy) NSString * subtitle;
@property (nonatomic, readwrite, copy) NSString * viewControllerClassName;

@end


@implementation Sample

#pragma mark - NSObject Lifecycle

- (id)init {
    return [self initWithDictionary:nil];
}

+ (id)sampleWithDictionary:(NSDictionary *)dictionary {
    return [[[self class] alloc] initWithDictionary:dictionary];
}

- (id)initWithDictionary:(NSDictionary *)dictionary {
    self = [super init];
    if (self) {
        self.title = dictionary[@"Title"];
        self.subtitle = dictionary[@"Subtitle"];
        self.viewControllerClassName = dictionary[@"ViewControllerClass"];
    }
    return self;
}

@end
