/*
 * OnScreenButtonsViewController.h
 *
 * This file is a part of the Yandex Map Kit.
 *
 * Version for iOS © 2011-2012 YANDEX
 * 
 * You may not use this file except in compliance with the License.
 * You may obtain a copy of the License at http://legal.yandex.ru/mapkit/
 */

#import "YandexMapKit.h"
#import "MapViewController.h"

@interface OnScreenButtonsViewController : MapViewController

- (IBAction)zoomPlusButtonTapped:(id)sender;
- (IBAction)zoomMinusButtonTapped:(id)sender;
- (IBAction)locateMeButtonTapped:(id)sender;

@property (nonatomic, strong) IBOutlet YMKLocationFetcher *locationFetcher;
@property (nonatomic, strong) IBOutlet UIActivityIndicatorView *activityIndicator;
@property (nonatomic, strong) IBOutlet UIButton *locateMeButton;

@end
