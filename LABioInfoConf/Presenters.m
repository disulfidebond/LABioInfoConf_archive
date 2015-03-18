//
//  Presenters.m
//  LABioInfoConf
//
//  Created by John on 3/3/15.
//  Copyright (c) 2015 John. All rights reserved.
//

#import "Presenters.h"

@implementation Presenters


+ (instancetype) tempClassInit
{
    // this class is only a temp class, replace with method and class (or instance?) method
    NSString *tempPresenter = @"Dr. Anton Nekruntenko";
    NSString *tempTopic = @"Comparative Genome Analysis";
    NSString *tempTime = @"Friday, April 17, 1:00 pm";
    
    Presenters *temporaryReturn = [[self alloc] initWithPresenterName:tempPresenter andPresenterTopic:tempTopic andPresenterTime:tempTime];
    return temporaryReturn;
}

- (instancetype) initWithPresenterName:(NSString *)name andPresenterTopic:(NSString *)topic andPresenterTime:(NSString *)time
{
    self = [super init];
    if (self) {
        self.presenterName = name;
        self.presenterTopic = topic;
        self.presenterTime = time;
    }
    return self;
}

- (instancetype) init
{
    // default values
    return [self initWithPresenterName:@"Presenter" andPresenterTopic:@"Topic" andPresenterTime:@"April 17, 1:00 pm"];
    
}

@end
