//
//  PresenterList.h
//  LABioInfoConf
//
//  Created by John on 3/3/15.
//  Copyright (c) 2015 John. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Presenters;

@interface PresenterList : NSObject

@property (nonatomic, readonly) NSArray *listOfPresenters;

+ (instancetype) presentersGroup;
- (Presenters *) showPresenters;

@end
