/*
 * YMKSMovingAnnotationsViewController.m
 *
 * This file is a part of the Yandex Map Kit.
 *
 * Version for iOS © 2011-2013 YANDEX
 *
 * You may not use this file except in compliance with the License.
 * You may obtain a copy of the License at http://legal.yandex.ru/mapkit/
 */

#import "YMKSMovingAnnotationsViewController.h"


@interface YMKSMovingAnnotationsViewController ()

@property (nonatomic, strong) PointAnnotation *targetAnnotation;
@property (nonatomic, strong) NSTimer *timer;
@property (nonatomic, assign) YMKMapCoordinate origin;

@end


@implementation YMKSMovingAnnotationsViewController

- (void)dealloc
{
    [_timer invalidate];
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self configureMapView];
    [self configureAndInstallAnnotations];
}

- (void)viewDidUnload
{
    self.targetAnnotation = nil;
    [super viewDidUnload];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.timer = [NSTimer scheduledTimerWithTimeInterval:0.025
                                                  target:self
                                                selector:@selector(step)
                                                userInfo:nil
                                                 repeats:YES];
    [self.timer fire];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [self.timer invalidate];
    self.timer = nil;
    [super viewWillDisappear:animated];
}

#pragma mark - YMKMapViewDelegate

- (YMKAnnotationView *)mapView:(YMKMapView *)mapView viewForAnnotation:(id<YMKAnnotation>)annotation
{
    static NSString *identifier = @"targetAnnotation";
    YMKPinAnnotationView *view = (YMKPinAnnotationView *)[mapView dequeueReusableAnnotationViewWithIdentifier:identifier];
    if (view == nil) {
        view = [[YMKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:identifier];
        view.canShowCallout = NO;
        view.image = view.selectedImage = [UIImage imageNamed:@"target.png"];
    }
    return view;
}

#pragma mark - Helpers

- (void)configureMapView
{
    self.mapView.showsUserLocation = NO;
    self.mapView.showTraffic = NO;
    [self.mapView setCenterCoordinate:YMKMapCoordinateMake(55.764231, 37.561723)
                          atZoomLevel:13
                             animated:NO];
}

- (void)configureAndInstallAnnotations
{
    self.origin = YMKMapCoordinateMake(55.764231, 37.561723);
    self.targetAnnotation = [PointAnnotation pointAnnotation];
    self.targetAnnotation.coordinate = self.origin;
    self.targetAnnotation.title = @"Двигающийся объект";
    [self.mapView addAnnotation:self.targetAnnotation];
    self.mapView.selectedAnnotation = self.targetAnnotation;
}

#pragma mark - Timer

- (void)step
{
    static CGFloat delta = 0;
    static CGFloat step = 0.0001;
    
    self.targetAnnotation.coordinate = YMKMapCoordinateMake(self.origin.latitude + delta,
                                                            self.origin.longitude + delta);

    delta += step;
    if (delta > 0.01 || delta < -0.01) {
        step = -step;
    }
}

@end
