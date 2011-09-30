//
//  DraggableAnnotationViewController.m
//  YandexMapKitSample
//
//  Created by Roman Busyghin on 9/18/11.
//  Copyright 2011 Яндекс. All rights reserved.
//

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

- (YMKAnnotationView *)mapView:(YMKMapView *)mapView viewForAnnotation:(id<YMKAnnotation>)annotation {
    static NSString * identifier = @"pointAnnotation";
    YMKPinAnnotationView * view = (YMKDraggablePinAnnotationView *)[mapView dequeueReusableAnnotationViewWithIdentifier:identifier];
    if (view == nil) {
        view = [[[YMKDraggablePinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:identifier] autorelease];
        view.canShowCallout = YES;
        view.pinColor = YMKPinAnnotationColorBlue;
    }

    return view;
}

#pragma mark - Helpers

- (void)configureMapView {
    self.mapView.showsUserLocation = NO;
    self.mapView.zoomButtons.hidden = YES;
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
