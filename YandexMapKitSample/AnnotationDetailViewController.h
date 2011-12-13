/*
 * AnnotationDetailViewController.h
 *
 * This file is a part of the Yandex Map Kit.
 *
 * Version for iOS © 2011 YANDEX
 * 
 * You may not use this file except in compliance with the License.
 * You may obtain a copy of the License at http://legal.yandex.ru/mapkit/
 */

#import <UIKit/UIKit.h>
#import "YandexMapKit.h"

@interface AnnotationDetailViewController : UIViewController {
    UILabel *titleLabel;
    UILabel *subtitleLabel;
    UILabel *coordinateLabel;
}

@property (nonatomic, retain) IBOutlet UILabel *titleLabel;
@property (nonatomic, retain) IBOutlet UILabel *subtitleLabel;
@property (nonatomic, retain) IBOutlet UILabel *coordinateLabel;

@property (nonatomic, retain) id<YMKAnnotation> annotation;

@end
