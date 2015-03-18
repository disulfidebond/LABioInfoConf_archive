//
//  InfoViewController.m
//  BioInfo Conf App
//
//  Created by John on 3/13/15.
//  Copyright (c) 2015 John. All rights reserved.
//

#import "InfoViewController.h"
#import "CCTMapViewController.h"

// Updates for v1.1
// - Remove Registration Link
// - verify other links
// Updates for v1.2
// - remove page, replace with "Thank you, see you next year", maybe provide link to LBRN

@implementation InfoViewController

/*
- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"showConferenceLocation"]) {
        UINavigationController *nc = (UINavigationController *)segue.destinationViewController;
        CCTMapViewController *mvc = (CCTMapViewController *)[nc topViewController];
        mvc.title = @"test";
        
        
    }
}
*/

- (void) viewDidLoad
{
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"Poster_farbackground_p1.png"]];
}

- (IBAction)conferenceLocationPressed:(UIButton *)sender {
    
    
}
- (IBAction)registrationButtonPressed:(UIButton *)sender {
    
    NSString *lbrnRegistration = @"http://lbrn.lsu.edu/events/bioinformatics-conference/registration";
    NSURL *url = [NSURL URLWithString:lbrnRegistration];
    [[UIApplication sharedApplication] openURL:url];
    
}

- (IBAction)conferenceButtonPressed:(UIButton *)sender {
    NSString *lbrnRegistration = @"http://lbrn.lsu.edu/events/bioinformatics-conference";
    NSURL *url = [NSURL URLWithString:lbrnRegistration];
    [[UIApplication sharedApplication] openURL:url];
    
}

- (IBAction)conferenceDateButtonPressed:(UIButton *)sender {
    // add reminder for registration date and Conf date (do last)
}


@end
