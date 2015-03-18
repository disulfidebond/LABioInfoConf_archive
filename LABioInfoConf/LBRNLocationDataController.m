//
//  LBRNLocationDataController.m
//  LRBN Conference Template
//
//  Created by John on 2/16/15.
//  Copyright (c) 2015 John. All rights reserved.
//

#import "LBRNLocationDataController.h"

@implementation LBRNLocationDataController

- (LBRNLocation *) getConferenceLocation
{
    LBRNLocation *buildingLocation = [[LBRNLocation alloc] init];
    // buildingLocation.address = @"Center for Computation and Technology, 340 East Parker Boulevard, Baton Rouge, LA 70808";
    buildingLocation.anTitle = @"LSU Digital Media Center";
    buildingLocation.subTitle = @"Location for Conference";
    buildingLocation.latitude = 30.407365;
    buildingLocation.longitude = -91.171488;
    return buildingLocation;
}

@end
