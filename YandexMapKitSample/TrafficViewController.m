//
//  TrafficViewController.m
//  YandexMapKitSample
//
//  Created by Roman Busyghin on 9/18/11.
//  Copyright 2011 Яндекс. All rights reserved.
//

#import "TrafficViewController.h"

@interface TrafficViewController ()

- (void)subscribeForTrafficNotifications;
- (void)unsubscribeFromTrafficNotifications;
- (void)updateTrafficInformer;
- (void)configureMapView;

@end


@implementation TrafficViewController

#pragma mark - View lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];

    [self configureMapView];
    [self updateTrafficInformer];
    [self subscribeForTrafficNotifications];
}

- (void)viewDidUnload {
    [self unsubscribeFromTrafficNotifications];

    [super viewDidUnload];
}

#pragma mark - Helpers

- (void)configureMapView {
    self.mapView.showsUserLocation = NO;
    self.mapView.zoomButtons.hidden = NO;
    self.mapView.showTraffic = YES;
    [self.mapView setCenterCoordinate:YMKMapCoordinateMake(55.753699, 37.619001)
                          atZoomLevel:11
                             animated:NO];
}

#pragma mark - Traffic Notifications

- (void)updateTrafficInformer {
    YMKTrafficInformer * informer = [self.mapView.trafficInformers lastObject];
    self.title = [NSString stringWithFormat:@"Пробки: %d", informer.value];
}

- (void)subscribeForTrafficNotifications {
    [self.mapView addObserver:self forKeyPath:@"trafficInformers" options:0 context:NULL];
}

- (void)unsubscribeFromTrafficNotifications {
    [self.mapView removeObserver:self forKeyPath:@"trafficInformers"];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
    if ([keyPath isEqualToString:@"trafficInformers"] && object == self.mapView) {
        [self updateTrafficInformer];
    }
    else {
		[super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
	}
}

#pragma mark - Memory Management

- (void)dealloc {
    [self unsubscribeFromTrafficNotifications];
    [super dealloc];
}

@end
