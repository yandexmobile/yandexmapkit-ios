/*
 * CustomAnnotationViewController.m
 *
 * This file is a part of the Yandex Map Kit.
 *
 * Version for iOS © 2011 YANDEX
 * 
 * You may not use this file except in compliance with the License.
 * You may obtain a copy of the License at http://legal.yandex.ru/mapkit/
 */

#import "CustomAnnotationViewController.h"

@interface CustomAnnotationViewController ()

- (void)configureMapView;
- (void)configureAndInstallAnnotations;
- (void)configureAnnotationView:(YMKPinAnnotationView *)view forAnnotation:(id<YMKAnnotation>)annotation;

@property (nonatomic, retain) PointAnnotation * annotation;

@end


@implementation CustomAnnotationViewController

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
    YMKPinAnnotationView * view = (YMKPinAnnotationView *)[mapView dequeueReusableAnnotationViewWithIdentifier:identifier];
    if (view == nil) {
        view = [[[YMKAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:identifier] autorelease];
    }
    
    [self configureAnnotationView:view forAnnotation:annotation];
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
    
    [self.mapView addAnnotation:self.annotation];
    self.mapView.selectedAnnotation = self.annotation;
}

- (void)configureAnnotationView:(YMKPinAnnotationView *)view forAnnotation:(id<YMKAnnotation>)annotation {
    if (annotation == self.annotation) {
        view.image = [UIImage imageNamed:@"yandex.png"];
    }
}

#pragma mark - Properties

@synthesize annotation;

#pragma mark - Memory Management

- (void)dealloc {
    self.annotation = nil;
    
    [super dealloc];
}

@end
