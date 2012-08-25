/*
 * AnnotationDetailViewController.m
 *
 * This file is a part of the Yandex Map Kit.
 *
 * Version for iOS © 2011 YANDEX
 * 
 * You may not use this file except in compliance with the License.
 * You may obtain a copy of the License at http://legal.yandex.ru/mapkit/
 */

#import "AnnotationDetailViewController.h"

@interface AnnotationDetailViewController ()

- (void)configureAnnotationDetail;

@end


@implementation AnnotationDetailViewController

#pragma mark - View lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Подробности";
    [self configureAnnotationDetail];
}

- (void)viewDidUnload {
    self.titleLabel = nil;
    self.subtitleLabel = nil;
    self.coordinateLabel = nil;

    [super viewDidUnload];
}

#pragma mark - Helpers

- (void)configureAnnotationDetail {
    self.titleLabel.text = self.annotation.title;
    self.subtitleLabel.text = self.annotation.subtitle;
    self.coordinateLabel.text = NSHumanReadableStringFromMapCoordinate(self.annotation.coordinate);
}

#pragma mark - Properties

@synthesize titleLabel;
@synthesize subtitleLabel;
@synthesize coordinateLabel;
@synthesize annotation;

#pragma mark - Memory Management

- (void)dealloc {
    self.titleLabel = nil;
    self.subtitleLabel = nil;
    self.coordinateLabel = nil;
    self.annotation = nil;

    [super dealloc];
}
@end
