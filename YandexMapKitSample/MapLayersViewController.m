/*
 * MapLayersViewController.h
 *
 * This file is a part of the Yandex Map Kit.
 *
 * Version for iOS © 2011-2012 YANDEX
 * 
 * You may not use this file except in compliance with the License.
 * You may obtain a copy of the License at http://legal.yandex.ru/mapkit/
 */

#import "MapLayersViewController.h"
#import "YMKConfiguration.h"

@interface MapLayersViewController ()

@property (nonatomic, retain) NSMutableArray *layers;

- (void)subscribeForMapLayerUpdates;
- (void)unsubscribeFromLayerUpdates;
- (void)updateMapLayers;
- (void)configureMapView;

@end


@implementation MapLayersViewController

#pragma mark - View lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];

    [self subscribeForMapLayerUpdates];
    [self configureMapView];
    [self updateMapLayers];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navigationController.toolbarHidden = NO;
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    self.navigationController.toolbarHidden = YES;
}

- (void)viewDidUnload {
    [self unsubscribeFromLayerUpdates];
    
    [super viewDidUnload];
}

#pragma mark - Helpers

- (void)configureMapView {
    self.mapView.showsUserLocation = NO;
    self.mapView.showTraffic = NO;
    [self.mapView setCenterCoordinate:YMKMapCoordinateMake(55.753699, 37.619001)
                          atZoomLevel:11
                             animated:NO];
}

#pragma mark - Layers Notifications

- (void)updateMapLayers {
    NSArray * layerInfos = [YMKConfiguration sharedInstance].mapLayers.infos;
    NSMutableArray * layerTitles = [[NSMutableArray alloc] initWithCapacity:[layerInfos count]];
    self.layers = [NSMutableArray arrayWithCapacity:[layerInfos count]];
    
    for (YMKMapLayerInfo * layerInfo in layerInfos) {
        if (layerInfo.auxiliary == NO) {
            [layerTitles addObject:layerInfo.localizedName];
            [self.layers addObject:layerInfo];
        }
    }
    
    UISegmentedControl * segmentedControl = [[UISegmentedControl alloc] initWithItems:layerTitles];
    segmentedControl.segmentedControlStyle = UISegmentedControlStyleBar;
    segmentedControl.selectedSegmentIndex = (self.mapView.visibleLayerIdentifier - 1);
    [segmentedControl addTarget:self action:@selector(layerChange:) forControlEvents:UIControlEventValueChanged];
    
    UIBarButtonItem * item = [[UIBarButtonItem alloc] initWithCustomView:segmentedControl];
    self.toolbarItems = [NSArray arrayWithObject:item];
    
    [item release];
    [layerTitles release];
    [segmentedControl release];
}

- (void)layerChange:(UISegmentedControl *)sender {
    NSInteger index = sender.selectedSegmentIndex;
    YMKMapLayerInfo *layerInfo = [self.layers objectAtIndex:index];
    self.mapView.visibleLayerIdentifier = layerInfo.identifier;
}

- (void)subscribeForMapLayerUpdates {
    [[YMKConfiguration sharedInstance] addObserver:self forKeyPath:@"mapLayers" options:0 context:NULL];
}

- (void)unsubscribeFromLayerUpdates {
    [[YMKConfiguration sharedInstance] removeObserver:self forKeyPath:@"mapLayers"];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
    if ([keyPath isEqualToString:@"mapLayers"]) {
        [self updateMapLayers];
    }
    else {
		[super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
	}
}

#pragma mark - Memory Management

- (void)dealloc {
    [self unsubscribeFromLayerUpdates];

    self.layers = nil;

    [super dealloc];
}

@end
