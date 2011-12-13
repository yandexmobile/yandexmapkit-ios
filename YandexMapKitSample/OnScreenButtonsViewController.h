//
//  OnScreenButtonsViewController.h
//  YandexMapKitSample
//
//  Created by Roman Busyghin on 12/13/11.
//  Copyright (c) 2011 Яндекс. All rights reserved.
//

#import "MapViewController.h"
#import "LocationFetcher.h"

@interface OnScreenButtonsViewController : MapViewController

- (IBAction)zoomPlusButtonTapped:(id)sender;
- (IBAction)zoomMinusButtonTapped:(id)sender;
- (IBAction)locateMeButtonTapped:(id)sender;

@property (nonatomic, retain) IBOutlet LocationFetcher *locationFetcher;
@property (nonatomic, retain) IBOutlet UIActivityIndicatorView *activityIndicator;
@property (nonatomic, retain) IBOutlet UIButton *locateMeButton;

@end
