/*
 * StaticMapExampleViewController.m
 *
 * This file is a part of the Yandex Map Kit.
 *
 * Version for iOS © 2012 YANDEX
 * 
 * You may not use this file except in compliance with the License.
 * You may obtain a copy of the License at http://legal.yandex.ru/mapkit/
 */

#import "StaticMapExampleViewController.h"

#import <YMKMapImageBuilder.h>


@interface StaticMapExampleViewController () <YMKMapImageBuilderDelegate>

@property (nonatomic, weak) IBOutlet UIImageView *staticMap;
@property (nonatomic, weak) IBOutlet UIActivityIndicatorView *activityIndicator;
@property (nonatomic, strong) YMKMapImageBuilder *mapImageBuilder;

@end




@implementation StaticMapExampleViewController

- (void)configureMapView {
    self.mapView.showsUserLocation = NO;
    self.mapView.showTraffic = NO;
    [self.mapView setCenterCoordinate:YMKMapCoordinateMake(55.733945, 37.588102)
                          atZoomLevel:16
                             animated:NO];
    
    [self createStaticMap];
}

#pragma mark - View lifecycle

- (NSString *)nibName {
    return @"StaticMapExampleViewController";
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self configureMapView];
}

#pragma mark - Memory Management

- (void)viewDidUnload
{
    [self deallocOrUnload];

    [super viewDidUnload];
}

- (void)deallocOrUnload
{
    self.staticMap = nil;
    self.activityIndicator = nil;
}

- (void)dealloc
{
    [self deallocOrUnload];

}


- (YMKMapImageBuilder *)mapImageBuilder {
    if (!_mapImageBuilder) {
        _mapImageBuilder = [[YMKMapImageBuilder alloc] init];
        _mapImageBuilder.delegate = self;
    }
    return _mapImageBuilder;
}

#pragma mark - YMKMapViewDelegate

- (void)mapView:(YMKMapView *)mapView gotSingleTapAtCoordinate:(YMKMapCoordinate)coordinate {
    PointAnnotation *annotation = [PointAnnotation pointAnnotation];
    annotation.coordinate = coordinate;
    annotation.title = [NSString stringWithFormat:@"#%d", 1 + [self.mapView.annotations count]];
    
    [self.mapView addAnnotation:annotation];
    
    [self createStaticMap];
}

- (void)mapViewWasDragged:(YMKMapView *)mapView {
    [self createStaticMap];
}

- (void)mapView:(YMKMapView *)mapView regionDidChangeAnimated:(BOOL)animated {
    [self createStaticMap];
}


#pragma mark - YMKMapImageBuilder main example

- (void)createStaticMap {
    [self.mapImageBuilder cancel];
    self.activityIndicator.hidden = NO;
    [self.activityIndicator startAnimating];
    
    self.mapImageBuilder.annotations = self.mapView.annotations;
    self.mapImageBuilder.centerCoordinate = self.mapView.centerCoordinate;
    self.mapImageBuilder.zoomLevel = self.mapView.zoomLevel;
    self.mapImageBuilder.layerIdentifier = self.mapView.visibleLayerIdentifier;
    self.mapImageBuilder.imageSize = self.staticMap.frame.size;
    [self.mapImageBuilder build];
}

- (void)renderingDoneWithImage:(UIImage *)image {
    self.staticMap.image = image;
    self.activityIndicator.hidden = YES;
    [self.activityIndicator stopAnimating];
}

#pragma mark - YMKMapImageBuilderDelegate


- (void)mapImageBuilder:(YMKMapImageBuilder *)builder builtImage:(UIImage *)image {
    [self renderingDoneWithImage:image];
}

- (void)mapImageBuilderFailedToLoadCompleteImage:(YMKMapImageBuilder *)builder partialImage:(UIImage *)image {
    [self renderingDoneWithImage:image];
}

- (void)mapImageBuilderWasCancelled:(YMKMapImageBuilder *)builder {
    [self renderingDoneWithImage:self.staticMap.image];
}


@end
