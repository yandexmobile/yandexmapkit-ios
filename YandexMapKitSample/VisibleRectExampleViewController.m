/*
 * VisibleRectExampleViewController.m
 *
 * This file is a part of the Yandex Map Kit.
 *
 * Version for iOS © 2011 YANDEX
 * 
 * You may not use this file except in compliance with the License.
 * You may obtain a copy of the License at http://legal.yandex.ru/mapkit/
 */

#import "VisibleRectExampleViewController.h"

@interface VisibleRectExampleViewController ()

@property (nonatomic, retain) PointAnnotation * annotation;

- (void)deallocOrUnload;

@end


@implementation VisibleRectExampleViewController

@synthesize locateMeButton;
@synthesize annotation;
@synthesize visibleRectView;


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
    self.annotation.title = @"Yandex";
    
    [self.mapView addAnnotation:self.annotation];
}

#pragma mark - View lifecycle

- (NSString *)nibName {
    return @"VisibleRectExampleViewController";
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self configureMapView];
    [self configureAndInstallAnnotations];
}

#pragma mark - IBActions

- (IBAction)locateMeButtonTapped:(id)sender {
    [self.mapView scrollToAnnotation:self.annotation animated:YES];
}

#pragma mark - Memory Management

- (void)viewDidUnload
{
    [self deallocOrUnload];

    [super viewDidUnload];
}

- (void)deallocOrUnload
{
    self.locateMeButton = nil;
    self.visibleRectView = nil;
}

- (void)dealloc
{
    [self deallocOrUnload];

    [super dealloc];
}

#pragma mark - YMKMapViewDelegate

- (CGRect)mapViewVisibleRect:(YMKMapView *)mapView {
    return visibleRectView.frame;
}

@end
