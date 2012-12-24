/*
 * CustomAnnotationViewController.m
 *
 * This file is a part of the Yandex Map Kit.
 *
 * Version for iOS © 2011-2012 YANDEX
 * 
 * You may not use this file except in compliance with the License.
 * You may obtain a copy of the License at http://legal.yandex.ru/mapkit/
 */

#import "CustomAnnotationViewController.h"

@interface CustomAnnotationViewController ()

@property (nonatomic, strong) PointAnnotation * annotation;

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

- (YMKAnnotationView *)mapView:(YMKMapView *)aMapView viewForAnnotation:(id<YMKAnnotation>)anAnnotation {
    static NSString * identifier = @"pointAnnotation";
    YMKPinAnnotationView * view = (YMKPinAnnotationView *)[aMapView dequeueReusableAnnotationViewWithIdentifier:identifier];
    if (view == nil) {
        view = [[YMKPinAnnotationView alloc] initWithAnnotation:anAnnotation
                                                 reuseIdentifier:identifier];
    }
    
    [self configureAnnotationView:view forAnnotation:anAnnotation];
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

- (void)configureAnnotationView:(YMKPinAnnotationView *)aView forAnnotation:(id<YMKAnnotation>)anAnnotation {
    if (anAnnotation == self.annotation) {
        aView.image = [UIImage imageNamed:@"yandex.png"];
        aView.selectedImage = nil;
    }
}

@end
