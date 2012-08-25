/*
 * DraggableAnnotationViewController.m
 *
 * This file is a part of the Yandex Map Kit.
 *
 * Version for iOS © 2011-2012 YANDEX
 * 
 * You may not use this file except in compliance with the License.
 * You may obtain a copy of the License at http://legal.yandex.ru/mapkit/
 */

#import "DraggableAnnotationViewController.h"

@interface DraggableAnnotationViewController ()

- (void)configureMapView;
- (void)configureAndInstallAnnotations;

@property (nonatomic, retain) PointAnnotation * annotation;

@end


@implementation DraggableAnnotationViewController

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

- (YMKAnnotationView *)mapView:(YMKMapView *)aMapView viewForAnnotation:(id<YMKAnnotation>)anAnnotation {
    static NSString * identifier = @"pointAnnotation";
    YMKDraggablePinAnnotationView * view = (YMKDraggablePinAnnotationView *)[aMapView dequeueReusableAnnotationViewWithIdentifier:identifier];
    if (view == nil) {
        view = [[[YMKDraggablePinAnnotationView alloc] initWithAnnotation:self.annotation
                                                          reuseIdentifier:identifier] autorelease];
        view.canShowCallout = YES;
        view.pinColor = YMKPinAnnotationColorBlue;
    }

    return view;
}

#pragma mark - Helpers

- (void)configureMapView {
    self.mapView.showsUserLocation = NO;
    self.mapView.showTraffic = NO;
    [self.mapView setCenterCoordinate:YMKMapCoordinateMake(55.733945, 37.588102)
                          atZoomLevel:16
                             animated:NO];
}

- (void)configureAndInstallAnnotations {
    self.annotation = [PointAnnotation pointAnnotation];
    self.annotation.coordinate = YMKMapCoordinateMake(55.733945, 37.588102);
    self.annotation.title = @"Перетащи меня!";
    
    [self.mapView addAnnotation:self.annotation];
    self.mapView.selectedAnnotation = self.annotation;
}

#pragma mark - Properties

@synthesize annotation;

#pragma mark - Memory Management

- (void)dealloc {
    self.annotation = nil;
    
    [super dealloc];
}

@end
