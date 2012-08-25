/*
 * Sample.h
 *
 * This file is a part of the Yandex Map Kit.
 *
 * Version for iOS © 2011-2012 YANDEX
 * 
 * You may not use this file except in compliance with the License.
 * You may obtain a copy of the License at http://legal.yandex.ru/mapkit/
 */

#import <Foundation/Foundation.h>

@interface Sample : NSObject

@property (nonatomic, readonly, copy) NSString * title;
@property (nonatomic, readonly, copy) NSString * subtitle;
@property (nonatomic, readonly, copy) NSString * viewControllerClassName;

- (id)initWithDictionary:(NSDictionary *)dictionary; // Designated initializer
+ (id)sampleWithDictionary:(NSDictionary *)dictionary;

@end
