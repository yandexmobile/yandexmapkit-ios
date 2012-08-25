/*
 * OnScreenButtonsViewController.m
 *
 * This file is a part of the Yandex Map Kit.
 *
 * Version for iOS © 2011-2012 YANDEX
 * 
 * You may not use this file except in compliance with the License.
 * You may obtain a copy of the License at http://legal.yandex.ru/mapkit/
 */

#import "OnScreenButtonsViewController.h"

@interface OnScreenButtonsViewController ()

- (IBAction)zoomPlusButtonTapped:(id)sender;
- (IBAction)zoomMinusButtonTapped:(id)sender;
- (IBAction)locateMeButtonTapped:(id)sender;

@property (nonatomic, weak) IBOutlet YMKLocationFetcher *locationFetcher;
@property (nonatomic, weak) IBOutlet UIActivityIndicatorView *activityIndicator;
@property (nonatomic, weak) IBOutlet UIButton *locateMeButton;

@end


@implementation OnScreenButtonsViewController

#pragma mark - View lifecycle

- (NSString *)nibName {
    return @"OnScreenButtonsViewController";
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self updateFetchingLocationUI];
    [self startMonitoringLocationFetching];
}

#pragma mark - IBActions

- (IBAction)zoomPlusButtonTapped:(id)sender {
    [self.mapView zoomIn];
}

- (IBAction)zoomMinusButtonTapped:(id)sender {
    [self.mapView zoomOut];
}

- (IBAction)locateMeButtonTapped:(id)sender {
    [self.locationFetcher acquireUserLocationFromMapView];
}

#pragma mark - Monitoring Location Fetching

- (void)startMonitoringLocationFetching
{
    [self.locationFetcher addObserver:self forKeyPath:@"fetchingLocation" options:0 context:NULL];    
}

- (void)stopMonitoringLocationFetching
{
    [self.locationFetcher removeObserver:self forKeyPath:@"fetchingLocation"];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    if ((object == self.locationFetcher) && [keyPath isEqualToString:@"fetchingLocation"]) {
        [self updateFetchingLocationUI];
    }
    else {
        [super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
    }
}

#pragma mark - Handle Fetched Location

- (void)setupActivityIndicatorVisible:(BOOL)activityShouldBeVisible
{
    if (activityShouldBeVisible) {
        self.activityIndicator.hidden = NO;
        [self.locateMeButton addSubview:self.activityIndicator];
        self.activityIndicator.frame = CGRectMake(floorf((CGRectGetWidth(self.locateMeButton.bounds) - CGRectGetWidth(self.activityIndicator.bounds)) / 2.0f),
                                                  floorf((CGRectGetHeight(self.locateMeButton.bounds) - CGRectGetHeight(self.activityIndicator.bounds)) / 2.0f),
                                                  CGRectGetWidth(self.activityIndicator.bounds),
                                                  CGRectGetHeight(self.activityIndicator.bounds));
    }
    else {
        self.activityIndicator.hidden = YES;
        [self.activityIndicator removeFromSuperview];
    }
}

- (void)setupLocateMeButtonForFetchingStatus:(BOOL)isFetchingLocation
{
    if (isFetchingLocation) {
        [self.locateMeButton setImage:nil forState:UIControlStateNormal];
        [self.locateMeButton setImage:nil forState:UIControlStateHighlighted];
    }
    else {
        [self.locateMeButton setImage:[UIImage imageNamed:@"LocateMe.png"]
                             forState:UIControlStateNormal];
        [self.locateMeButton setImage:[UIImage imageNamed:@"LocateMeHighlighted.png"]
                             forState:UIControlStateHighlighted];
    }
}

- (void)updateFetchingLocationUI
{
    [self setupActivityIndicatorVisible:self.locationFetcher.fetchingLocation];
    [self setupLocateMeButtonForFetchingStatus:self.locationFetcher.fetchingLocation];
}

- (void)locationFetcherDidFetchUserLocation:(YMKLocationFetcher *)locationFetcher
{
    [self updateFetchingLocationUI];
}

- (void)locationFetcher:(YMKLocationFetcher *)locationFetcher didFailWithError:(NSError *)error
{
    [self updateFetchingLocationUI];    
}

- (void)dealloc
{
    [self stopMonitoringLocationFetching];
}

@end
