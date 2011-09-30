//
//  AnnotationsViewController.m
//  YandexMapKitSample
//
//  Created by Roman Busyghin on 9/18/11.
//  Copyright 2011 Яндекс. All rights reserved.
//

#import "AnnotationsViewController.h"
#import "AnnotationDetailViewController.h"

@interface AnnotationsViewController ()

- (void)configureMapView;
- (void)configureAndInstallAnnotations;
- (void)configureAnnotationView:(YMKPinAnnotationView *)view forAnnotation:(id<YMKAnnotation>)annotation;
- (void)showDetailForAnnotation:(id<YMKAnnotation>)annotation;

@property (nonatomic, retain) PointAnnotation * metroAnnotation;
@property (nonatomic, retain) PointAnnotation * yacAnnotation;

@end


@implementation AnnotationsViewController

#pragma mark - View lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configureMapView];
    [self configureAndInstallAnnotations];
}

- (void)viewDidUnload {
    self.metroAnnotation = nil;
    self.yacAnnotation = nil;

    [super viewDidUnload];
}

#pragma mark - YMKMapViewDelegate

- (YMKAnnotationView *)mapView:(YMKMapView *)mapView viewForAnnotation:(id<YMKAnnotation>)annotation
{
    static NSString * identifier = @"pointAnnotation";
    YMKPinAnnotationView * view = (YMKPinAnnotationView *)[mapView dequeueReusableAnnotationViewWithIdentifier:identifier];
    if (view == nil) {
        view = [[[YMKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:identifier] autorelease];
        view.canShowCallout = YES;
        
        UIButton * rightButton = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
        view.rightCalloutAccessoryView = rightButton;            
    }
    
    [self configureAnnotationView:view forAnnotation:annotation];
    
    return view;
}

- (void)mapView:(YMKMapView *)mapView annotationView:(YMKAnnotationView *)view calloutAccessoryControlTapped:(UIControl *)control {
    [self showDetailForAnnotation:view.annotation];
}

- (void)mapView:(YMKMapView *)mapView annotationViewCalloutTapped:(YMKAnnotationView *)view {
    [self showDetailForAnnotation:view.annotation];
}

#pragma mark - Helpers

- (void)configureMapView {
    self.mapView.showsUserLocation = NO;
    self.mapView.zoomButtons.hidden = YES;
    self.mapView.showTraffic = NO;
    [self.mapView setCenterCoordinate:YMKMapCoordinateMake(55.757172, 37.55347)
                          atZoomLevel:13
                             animated:NO];
}

- (void)configureAndInstallAnnotations {
    self.metroAnnotation = [PointAnnotation pointAnnotation];
    self.metroAnnotation.coordinate = YMKMapCoordinateMake(55.764231, 37.561723);
    self.metroAnnotation.title = @"Метро 1905 года";
    self.metroAnnotation.subtitle = @"Последний вагон из центра";

    [self.mapView addAnnotation:self.metroAnnotation];
    self.mapView.selectedAnnotation = self.metroAnnotation;
    
    self.yacAnnotation = [PointAnnotation pointAnnotation];
    self.yacAnnotation.coordinate = YMKMapCoordinateMake(55.749475, 37.543084);
    self.yacAnnotation.title = @"YaC 2011";

    [self.mapView addAnnotation:self.yacAnnotation];
}

- (void)configureAnnotationView:(YMKPinAnnotationView *)view forAnnotation:(id<YMKAnnotation>)annotation {
    if (annotation == self.metroAnnotation) {
        view.pinColor = YMKPinAnnotationColorBlue;
    }
    else if (annotation == self.yacAnnotation) {
        view.pinColor = YMKPinAnnotationColorGreen;
    }
}

- (void)showDetailForAnnotation:(id<YMKAnnotation>)annotation {
    AnnotationDetailViewController * detailViewController = [[AnnotationDetailViewController alloc] init];
    detailViewController.annotation = annotation;
    [self.navigationController pushViewController:detailViewController animated:YES];
    [detailViewController release];
}

#pragma mark - Properties

@synthesize metroAnnotation;
@synthesize yacAnnotation;

#pragma mark - Memory Management

- (void)dealloc {
    self.metroAnnotation = nil;
    self.yacAnnotation = nil;

    [super dealloc];
}

@end
