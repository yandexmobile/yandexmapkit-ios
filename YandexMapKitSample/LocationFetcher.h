/*
 * LocationFetcher.h
 *
 * This file is a part of the Yandex Map Kit.
 *
 * Version for iOS © 2011 YANDEX
 * 
 * You may not use this file except in compliance with the License.
 * You may obtain a copy of the License at http://legal.yandex.ru/mapkit/
 */

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>
#import "YandexMapKit.h"


@class LocationFetcher;

@protocol LocationFetcherDelegate <NSObject>
@required

- (void)locationFetcherDidFetchUserLocation:(LocationFetcher *)locationFetcher;
- (void)locationFetcher:(LocationFetcher *)locationFetcher didFailWithError:(NSError *)error;

@end


@interface LocationFetcher : NSObject

@property (nonatomic, retain) IBOutlet YMKMapView * mapView;
@property (nonatomic, assign) IBOutlet id<LocationFetcherDelegate> delegate;
@property (nonatomic, assign, getter = isFetchingLocation) BOOL fetchingLocation;

- (void)acquireUserLocationFromMapView;

@end
