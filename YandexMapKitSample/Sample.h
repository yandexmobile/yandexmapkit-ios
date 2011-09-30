//
//  Sample.h
//  YandexMapKitSample
//
//  Created by Roman Busyghin on 9/18/11.
//  Copyright 2011 Яндекс. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Sample : NSObject

@property (nonatomic, readonly, copy) NSString * title;
@property (nonatomic, readonly, copy) NSString * subtitle;
@property (nonatomic, readonly, copy) NSString * viewControllerClassName;

- (id)initWithDictionary:(NSDictionary *)dictionary; // Designated initializer
+ (id)sampleWithDictionary:(NSDictionary *)dictionary;

@end
