/*
 * CustomCalloutViewController.m
 *
 * This file is a part of the Yandex Map Kit.
 *
 * Version for iOS © 2011-2012 YANDEX
 * 
 * You may not use this file except in compliance with the License.
 * You may obtain a copy of the License at http://legal.yandex.ru/mapkit/
 */

#import "CustomCalloutViewController.h"
#import "CalloutView.h"

@interface CustomCalloutViewController ()

- (void)configureMapView;
- (void)configureAndInstallAnnotations;

@property (nonatomic, strong) PointAnnotation * annotation;

@end


@implementation CustomCalloutViewController

#pragma mark - View lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configureMapView];
    [self configureAndInstallAnnotations];
}

- (void)viewDidUnload {
    self.annotation = nil;

    [super viewDidUnload];
}

#pragma mark - YMKMapViewDelegate

- (YMKAnnotationView *)mapView:(YMKMapView *)aMapView viewForAnnotation:(id<YMKAnnotation>)anAnnotation
{
    static NSString * identifier = @"pointAnnotation";
    YMKPinAnnotationView * view = (YMKPinAnnotationView *)[aMapView dequeueReusableAnnotationViewWithIdentifier:identifier];

    if (view == nil) {
        view = [[YMKPinAnnotationView alloc] initWithAnnotation:anAnnotation reuseIdentifier:identifier];
        view.canShowCallout = YES;        
    }

    return view;
}

- (YMKCalloutView *)mapView:(YMKMapView *)mapView calloutViewForAnnotation:(id<YMKAnnotation>)annotation {

    static NSString * customCalloutIdentifier = @"customCalloutIdentefier";
    YMKCalloutView * customCalloutView = [mapView dequeueReusableCalloutViewWithIdentifier:customCalloutIdentifier];

    if (!customCalloutView) {
        customCalloutView = [[YMKCalloutView alloc] initWithReuseIdentifier:customCalloutIdentifier];
        customCalloutView.contentView = [CalloutView loadView];
    }

    // обновление полей calloutView.contentView, если нужно

    return customCalloutView;
}

#pragma mark - Helpers

- (void)configureMapView {
    self.mapView.showsUserLocation = NO;
    self.mapView.showTraffic = NO;
    [self.mapView setCenterCoordinate:YMKMapCoordinateMake(55.755816, 37.623507)
                          atZoomLevel:11
                             animated:NO];
}

- (void)configureAndInstallAnnotations {
    self.annotation = [PointAnnotation pointAnnotation];
    self.annotation.coordinate = YMKMapCoordinateMake(55.749475, 37.543084);
    
    [self.mapView addAnnotation:self.annotation];
    self.mapView.selectedAnnotation = self.annotation;
}

#pragma mark - Memory Management


@end
