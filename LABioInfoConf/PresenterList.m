//
//  PresenterList.m
//  LABioInfoConf
//
//  Created by John on 3/3/15.
//  Copyright (c) 2015 John. All rights reserved.
//

#import "PresenterList.h"
#import "Presenters.h"

@interface PresenterList()
@property (nonatomic) NSMutableArray *currentPresenters;
@end

@implementation PresenterList

+ (instancetype) presentersGroup
{
    static PresenterList *presentersForConference;
    if (!presentersForConference) {
        presentersForConference = [[self alloc] init];
    }
    return presentersForConference;
}

- (instancetype) init
{
    self = [super init];
    if (self) {
        _currentPresenters = [[NSMutableArray alloc] init];
    }
    return self;
}

- (NSArray *) listOfPresenters
{
    return [self.currentPresenters copy];
}

- (Presenters *) showPresenters
{
    Presenters *presenter = [Presenters tempClassInit];
    
    // note: for final build, change presenters object to get from server,
    // then add updates to NSArray
    [self.currentPresenters addObject:presenter];
    
    return presenter;
}

@end
