//
//  PresenterInfoViewController.m
//  LABioInfoConf
//
//  Created by John on 3/4/15.
//  Copyright (c) 2015 John. All rights reserved.
//

#import "PresenterInfoViewController.h"
#import <MapKit/MapKit.h>

@interface PresenterInfoViewController ()

@end

// IMPORTANT: TEMPORARY ONLY!!
// For next build, push data from TableViewController, OR create Modal  -> tableViewController
//                                                                      -> PresenterInfoViewController

@implementation PresenterInfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // create getter from object Presenters
    self.presenterNameInfo.text = @"Dr. Anton Nekruntenko";
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)surveyButtonPressed:(UIButton *)sender {
    NSString *buttonTitle = NSLocalizedString(@"Cancel", @"Cancel");
        NSString *buttonTitle1 = NSLocalizedString(@"Take Survey For Presenter", @"Show Route in Maps");
    
    
    
    UIActionSheet *sheet = [[UIActionSheet alloc] initWithTitle:nil delegate:self cancelButtonTitle:buttonTitle destructiveButtonTitle:nil otherButtonTitles:buttonTitle1, nil];
    
    [sheet showInView:self.view];
    
}

- (void) actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    switch (buttonIndex) {
        case 0:
            // create a map region pointing to the earthquake location
            break;
            
        default:
            break;
    }
    
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
