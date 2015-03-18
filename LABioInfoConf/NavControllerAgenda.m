//
//  NavControllerAgenda.m
//  BioInfo Conf App
//
//  Created by John on 3/11/15.
//  Copyright (c) 2015 John. All rights reserved.
//

#import "NavControllerAgenda.h"

@implementation NavControllerAgenda

- (void) viewDidLoad
{
    UITabBarController *tb = self.tabBarController;
    UITabBarItem *itemAt0 = [tb.tabBar.items objectAtIndex:0];
    UITabBarItem *itemAt1 = [tb.tabBar.items objectAtIndex:1];
    UITabBarItem *itemAt2 = [tb.tabBar.items objectAtIndex:2];
    UITabBarItem *itemAt3 = [tb.tabBar.items objectAtIndex:3];
    
    itemAt0.selectedImage = [[UIImage imageNamed:@"agenda.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]; // Agenda
    itemAt0.image = [[UIImage imageNamed:@"agenda_.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    itemAt1.selectedImage = [[UIImage imageNamed:@"location.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]; // Location
    itemAt1.image = [[UIImage imageNamed:@"location_.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    itemAt2.selectedImage = [[UIImage imageNamed:@"presentations.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    // Presentations (deprecated: Presentation, Posters)
    itemAt2.image = [[UIImage imageNamed:@"presentations_.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    itemAt3.selectedImage = [[UIImage imageNamed:@"confinfo.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    // Info (deprecated: Registration)
    itemAt3.image = [[UIImage imageNamed:@"confinfo_.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    // as per Apple Docs: there are three parameters: title, selected, and unselected.  if image == nil, the image (a.k.a. deselected image) is not displayed.  if selectedimage == nil, the image is not displayed, if title == nil, the title is not displayed.  It appears IB will overwrite the title, but not the image capabilities.
}

@end
