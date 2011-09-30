//
//  AnnotationDetailViewController.m
//  YandexMapKitSample
//
//  Created by Roman Busyghin on 9/18/11.
//  Copyright 2011 Яндекс. All rights reserved.
//

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
    self.coordinateLabel.text = NSStringFromMapCoordinate(self.annotation.coordinate, YES);
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
