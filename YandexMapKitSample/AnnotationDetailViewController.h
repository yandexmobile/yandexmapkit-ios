//
//  AnnotationDetailViewController.h
//  YandexMapKitSample
//
//  Created by Roman Busyghin on 9/18/11.
//  Copyright 2011 Яндекс. All rights reserved.
//

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
