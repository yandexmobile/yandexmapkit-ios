//
//  LocationFetcher.h
//  YandexMapKitSample
//
//  Created by Roman Busyghin on 12/13/11.
//  Copyright (c) 2011 Яндекс. All rights reserved.
//

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
