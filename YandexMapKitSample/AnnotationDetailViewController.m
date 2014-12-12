/*
 * AnnotationDetailViewController.m
 *
 * This file is a part of the Yandex Map Kit.
 *
 * Version for iOS © 2011-2013 YANDEX
 *
 * You may not use this file except in compliance with the License.
 * You may obtain a copy of the License at http://legal.yandex.ru/mapkit/
 */

#import "AnnotationDetailViewController.h"

@interface AnnotationDetailViewController ()

@property (nonatomic, weak) IBOutlet UILabel *titleLabel;
@property (nonatomic, weak) IBOutlet UILabel *subtitleLabel;
@property (nonatomic, weak) IBOutlet UILabel *coordinateLabel;

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

- (UIRectEdge)edgesForExtendedLayout {
    return UIRectEdgeNone;
}

#pragma mark - Helpers

- (void)configureAnnotationDetail {
    self.titleLabel.text = self.annotation.title;
    self.subtitleLabel.text = self.annotation.subtitle;
    self.coordinateLabel.text = NSHumanReadableStringFromMapCoordinate(self.annotation.coordinate);
}

@end
