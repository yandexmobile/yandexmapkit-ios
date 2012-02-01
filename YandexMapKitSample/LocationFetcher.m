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

#import "LocationFetcher.h"

@interface LocationFetcher ()

@property (nonatomic, retain) NSTimer * locationAvailabilityCheckerTimer;
@property (nonatomic, retain) NSDate * locationAvailabilityCheckerTimerStartDate;

- (BOOL)canUseLocationServices;
- (BOOL)isUserLocationAvailableForMapView;

- (void)startLocationAvailabilityCheckerTimer;
- (void)stopLocationAvailabilityCheckerTimer;
- (void)locationAvailabilityCheckerTimerHit:(NSTimer *)timer;

- (void)notifyDelegateLocationAcquired;
- (void)notifyDelegateLocationError;

@end


static NSTimeInterval const kLocationFetcherLocationAvailabilityCheckerTimerPingInterval = 0.2;
static NSTimeInterval const kLocationFetcherLocationAvailabilityCheckerTimerTimeoutInterval = 30;


@implementation LocationFetcher

- (void)acquireUserLocationFromMapView
{
    if ([self canUseLocationServices] == NO) {
        [self notifyDelegateLocationError];
        return;
    }
	
	self.mapView.showsUserLocation = YES;
	self.mapView.tracksUserLocation = YES;

	if ([self isUserLocationAvailableForMapView]) {
        [self notifyDelegateLocationAcquired];
	}
	else {
		[self startLocationAvailabilityCheckerTimer];
		self.fetchingLocation = YES;
	}
}

#pragma mark - Helpers

- (BOOL)canUseLocationServices
{
    BOOL locationServicesEnabled = NO;
    BOOL locationServicesAllowed = YES;
    
    if ([CLLocationManager respondsToSelector:@selector(locationServicesEnabled)]) {
        locationServicesEnabled = [CLLocationManager locationServicesEnabled];        
    }
    else {
        CLLocationManager * tempLocationManager = [[CLLocationManager alloc] init];
        locationServicesEnabled = tempLocationManager.locationServicesEnabled;
        [tempLocationManager release];
    }

    
    if ([CLLocationManager respondsToSelector:@selector(authorizationStatus)]) {
        CLAuthorizationStatus authorizationStatus = [CLLocationManager authorizationStatus];
        
        if (authorizationStatus == kCLAuthorizationStatusDenied || 
            authorizationStatus == kCLAuthorizationStatusRestricted)
        {
            locationServicesAllowed = NO;
        }
    }
    
    return locationServicesEnabled && locationServicesAllowed;
}

- (BOOL)isUserLocationAvailableForMapView
{
    return (self.mapView.userLocation != nil) && (self.mapView.userLocation.location != nil);
}

#pragma mark - Location Availability Checker Timer

- (void)startLocationAvailabilityCheckerTimer
{
    [self stopLocationAvailabilityCheckerTimer];
	
	self.locationAvailabilityCheckerTimerStartDate = [NSDate date];
	self.locationAvailabilityCheckerTimer = [NSTimer scheduledTimerWithTimeInterval:kLocationFetcherLocationAvailabilityCheckerTimerPingInterval
                                                                             target:self 
                                                                           selector:@selector(locationAvailabilityCheckerTimerHit:)
                                                                           userInfo:nil 
                                                                            repeats:YES];    
}

- (void)stopLocationAvailabilityCheckerTimer
{
    [self.locationAvailabilityCheckerTimer invalidate];
    self.locationAvailabilityCheckerTimer = nil;
}

- (void)locationAvailabilityCheckerTimerHit:(NSTimer *)timer
{
	if ([self isUserLocationAvailableForMapView]) {
        self.fetchingLocation = NO;
		[self stopLocationAvailabilityCheckerTimer];
        [self notifyDelegateLocationAcquired];
	}
	
    BOOL isTimedOut = ([[NSDate date] timeIntervalSinceDate:self.locationAvailabilityCheckerTimerStartDate] > kLocationFetcherLocationAvailabilityCheckerTimerTimeoutInterval);
    if (!self.mapView.showsUserLocation || isTimedOut) {
        self.fetchingLocation = NO;
        [self stopLocationAvailabilityCheckerTimer];
        [self notifyDelegateLocationError];
    }
}

#pragma mark - Call Delegate Helpers

- (void)notifyDelegateLocationAcquired
{
    SEL selector = @selector(locationFetcherDidFetchUserLocation:);
    if ([self.delegate respondsToSelector:selector]) {
        [self.delegate performSelector:selector withObject:self];
    }
}

- (void)notifyDelegateLocationError
{
    SEL selector = @selector(locationFetcher:didFailWithError:);
    if ([self.delegate respondsToSelector:selector]) {
        [self.delegate performSelector:selector withObject:self withObject:nil];
    }    
}

#pragma mark - Memory Management

- (void)dealloc
{
    self.mapView = nil;
    self.locationAvailabilityCheckerTimer = nil;
    self.locationAvailabilityCheckerTimerStartDate = nil;

    [super dealloc];
}

#pragma mark - Properties

@synthesize mapView;
@synthesize delegate;
@synthesize fetchingLocation;
@synthesize locationAvailabilityCheckerTimer;
@synthesize locationAvailabilityCheckerTimerStartDate;

@end
