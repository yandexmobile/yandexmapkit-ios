/*
 * VisibleRectExampleViewController.h
 *
 * This file is a part of the Yandex Map Kit.
 *
 * Version for iOS © 2011 YANDEX
 * 
 * You may not use this file except in compliance with the License.
 * You may obtain a copy of the License at http://legal.yandex.ru/mapkit/
 */

#import "MapViewController.h"

@interface VisibleRectExampleViewController : MapViewController

- (IBAction)locateMeButtonTapped:(id)sender;

@property (nonatomic, retain) IBOutlet UIButton *locateMeButton;
@property (nonatomic, retain) IBOutlet UIView *visibleRectView;

@end
