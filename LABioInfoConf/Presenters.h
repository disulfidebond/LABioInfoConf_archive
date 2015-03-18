//
//  Presenters.h
//  LABioInfoConf
//
//  Created by John on 3/3/15.
//  Copyright (c) 2015 John. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Presenters : NSObject

+ (instancetype) tempClassInit;
- (instancetype) initWithPresenterName: (NSString *) name andPresenterTopic: (NSString *) topic andPresenterTime: (NSString *) time;

@property (nonatomic, copy) NSString *presenterName;
@property (nonatomic, copy) NSString *presenterTopic;
@property (nonatomic, copy) NSString *presenterTime; // probably change this to int or NSDate

@end
