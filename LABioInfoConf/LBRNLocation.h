//
//  LBRNLocation.h
//  LRBN Conference Template
//
//  Created by John on 2/16/15.
//  Copyright (c) 2015 John. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface LBRNLocation : NSObject<MKAnnotation>
@property (strong, nonatomic) NSString *anTitle;
@property (strong, nonatomic) NSString *subTitle;
@property (nonatomic) float latitude;
@property (nonatomic) float longitude;


@end
