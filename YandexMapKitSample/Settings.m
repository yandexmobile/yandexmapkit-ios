/*
 * Settings.m
 *
 * This file is a part of the Yandex Map Kit.
 *
 * Version for iOS © 2011-2013 YANDEX
 *
 * You may not use this file except in compliance with the License.
 * You may obtain a copy of the License at http://legal.yandex.ru/mapkit/
 */

#import "Settings.h"
#import <YMKConfiguration.h>

static NSString *const kYandexMapKitApiKey = @"YandexMapKitApiKey";

#warning Replace with your own Yandex Map Kit API key
static NSString *const kDefaultAPIKey = nil;


@implementation Settings

@dynamic apiKey;

static Settings *sharedSettings = nil;

+ (Settings *)sharedSettings {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedSettings = [self new];
    });
    return sharedSettings;
}

- (NSString *)apiKey {
    NSString *apiKey = [[NSUserDefaults standardUserDefaults] stringForKey:kYandexMapKitApiKey];
    return [apiKey length] ? apiKey : kDefaultAPIKey;
}

- (void)setApiKey:(NSString *)apiKey {
    [[NSUserDefaults standardUserDefaults] setValue:apiKey forKey:kYandexMapKitApiKey];
    [[NSUserDefaults standardUserDefaults] synchronize];

    [YMKConfiguration sharedInstance].apiKey = apiKey;
}

@end
