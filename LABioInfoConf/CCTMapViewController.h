//
//  CCTMapViewController.h
//  LRBN Conference Template
//
//  Created by John on 2/16/15.
//  Copyright (c) 2015 John. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>

@interface CCTMapViewController : UIViewController<MKMapViewDelegate,MKAnnotation,UIActionSheetDelegate>
@property (strong, nonatomic) IBOutlet MKMapView *mapview;


@end
