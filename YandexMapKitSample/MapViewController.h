//
//  MapViewController.h
//  YandexMapKitSample
//
//  Created by Roman Busyghin on 9/18/11.
//  Copyright 2011 Яндекс. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YandexMapKit.h"

#import "PointAnnotation.h"

@interface MapViewController : UIViewController <YMKMapViewDelegate>

@property (nonatomic, retain) IBOutlet YMKMapView * mapView;

@end
