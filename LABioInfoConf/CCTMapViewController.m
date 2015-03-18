//
//  CCTMapViewController.m
//  LRBN Conference Template
//
//  Created by John on 2/16/15.
//  Copyright (c) 2015 John. All rights reserved.
//

#import "CCTMapViewController.h"
#import "LBRNLocation.h"
#import "LBRNLocationDataController.h"
@import CoreLocation;

@interface CCTMapViewController ()<CLLocationManagerDelegate>
@property (strong, nonatomic) CLLocationManager *locationManager;


@end

// Updates for v1.1
// - Merge with Swift implementation
// - Use Map annotations to mark parking areas (Swift)
// - Change user CLLocation permission section to switch loop (Swift)

// Updates for v1.2
// - nil

@implementation CCTMapViewController
@synthesize coordinate;

- (void) viewDidAppear:(BOOL)animated
{
    LBRNLocationDataController *model = [[LBRNLocationDataController alloc] init];
    LBRNLocation *buildingLocation = [model getConferenceLocation];
    CLLocationCoordinate2D buildingLocationCoordinates;
    buildingLocationCoordinates.latitude = buildingLocation.latitude;
    buildingLocationCoordinates.longitude = buildingLocation.longitude;
    
    MKCoordinateRegion viewRegion = MKCoordinateRegionMakeWithDistance(buildingLocationCoordinates, 750, 750);
    
    
    [self.mapview setRegion:viewRegion animated:YES];
    
    // Get permission from user for location
    self.locationManager = [[CLLocationManager alloc] init];
    self.locationManager.delegate = self;
    
    /*
    CLAuthorizationStatus status = [CLLocationManager authorizationStatus];
    
    if (status == kCLAuthorizationStatusNotDetermined) {
        NSLog(@"Requesting when not in use");
        [self.locationManager requestWhenInUseAuthorization];
    } else if (status == kCLAuthorizationStatusDenied) {
        NSLog(@"Location Services denied");
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Update Settings" message:@"You may change your Privacy settings to allow this App to access your location" preferredStyle:UIAlertControllerStyleActionSheet];
        
        UIAlertAction *defaultAction = [UIAlertAction actionWithTitle:@"Settings" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString: UIApplicationOpenSettingsURLString]];
            }];
        UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){}];
        
        [alert addAction:defaultAction];
        [alert addAction:cancelAction];
        
        [self presentViewController:alert animated:YES completion:nil];
        
    } else if (status == kCLAuthorizationStatusAuthorizedWhenInUse) {
        NSLog(@"status auth in use");
        [self.locationManager startUpdatingLocation];
        
    } else if (status == kCLAuthorizationStatusAuthorizedAlways) {
        NSLog(@"status auth always");
        [self.locationManager startUpdatingLocation];
        
    } else if (status == kCLAuthorizationStatusRestricted) {
        NSLog(@"Location services restricted");
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Update Settings" message:@"You may change your Privacy settings to allow this App to access your location" preferredStyle:UIAlertControllerStyleActionSheet];
        
        UIAlertAction *defaultAction = [UIAlertAction actionWithTitle:@"Settings" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString: UIApplicationOpenSettingsURLString]];
        }];
        UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action){}];
        
        [alert addAction:defaultAction];
        [alert addAction:cancelAction];
        
        [self presentViewController:alert animated:YES completion:nil];

        
    } else {
        NSLog(@"Undefined status, %d", status);
    }

    
    if ([self.locationManager respondsToSelector:@selector(requestWhenInUseAuthorization)]) {
        [self.locationManager startUpdatingLocation];
    } else {
        [self.locationManager requestWhenInUseAuthorization];
    }
     */
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.mapview.delegate = self;
    self.mapview.mapType = MKMapTypeHybrid;
    self.mapview.showsUserLocation = YES;
    
    LBRNLocationDataController *model = [[LBRNLocationDataController alloc] init];
    LBRNLocation *buildingLocation = [model getConferenceLocation];
    
    MKPointAnnotation *bldgPoint = [[MKPointAnnotation alloc] init];
    bldgPoint.coordinate = CLLocationCoordinate2DMake(buildingLocation.latitude, buildingLocation.longitude);
    bldgPoint.title = buildingLocation.anTitle;
    bldgPoint.subtitle = buildingLocation.subTitle;
    [self.mapview addAnnotation:bldgPoint];
    
    
    // Tab View Setup
    
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
    
    itemAt3.selectedImage = [[UIImage imageNamed:@"confInfo.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    // Info (deprecated: Registration)
    itemAt3.image = [[UIImage imageNamed:@"confInfo_.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    }


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark Delegate Methods

- (MKAnnotationView *) mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation
{
    // return nil if location == userlocation
    if ([annotation isKindOfClass:[MKUserLocation class]]) {
        return nil;
    }
    if ([annotation isKindOfClass:[MKPointAnnotation class]]) {
        MKAnnotationView *pinView = (MKAnnotationView *)[mapView dequeueReusableAnnotationViewWithIdentifier:@"CustomPinAnnotationView"];
        if (!pinView) {
            pinView = [[MKAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:@"CustomPinAnnotationView"];
            pinView.canShowCallout = YES;
            pinView.image = [UIImage imageNamed:@"mapImg_.png"];
            pinView.calloutOffset = CGPointMake(0,32);
            
            UIImageView *iconView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"mapImg_.png"]];
            pinView.leftCalloutAccessoryView = iconView;
            
        } else {
            // [mapView.userLocation setTitle:@"Here!"];
            
        }
        return pinView;
    }
    return nil;
}


- (void) mapViewWillStartLocatingUser:(MKMapView *)mapView
{
    CLAuthorizationStatus authorizationStatus = [CLLocationManager authorizationStatus];
    
    if (authorizationStatus == kCLAuthorizationStatusAuthorizedWhenInUse){
        [self.locationManager startUpdatingLocation];
    } else if (authorizationStatus == kCLAuthorizationStatusAuthorizedAlways) {
        [self.locationManager startUpdatingLocation];
    } else if (authorizationStatus == kCLAuthorizationStatusNotDetermined) {
        [self.locationManager requestWhenInUseAuthorization];
    } else {
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Update Settings" message:@"You may change your Privacy settings to allow this App to access your location" preferredStyle:UIAlertControllerStyleActionSheet];
        
        UIAlertAction *defaultAction = [UIAlertAction actionWithTitle:@"Settings" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString: UIApplicationOpenSettingsURLString]];
        }];
        UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action){}];
        
        [alert addAction:defaultAction];
        [alert addAction:cancelAction];
        
        [self presentViewController:alert animated:YES completion:nil];
    }
}

- (IBAction)routeInMapsPressed:(UIButton *)sender {
    
    LBRNLocationDataController *model = [[LBRNLocationDataController alloc] init];
    LBRNLocation *buildingLocation = [model getConferenceLocation];
    
    MKPointAnnotation *bldgPoint = [[MKPointAnnotation alloc] init];
    bldgPoint.coordinate = CLLocationCoordinate2DMake(buildingLocation.latitude, buildingLocation.longitude);
    bldgPoint.title = buildingLocation.anTitle;
    bldgPoint.subtitle = buildingLocation.subTitle;
    [self.mapview addAnnotation:bldgPoint];
    
    MKPlacemark *placemark = [[MKPlacemark alloc] initWithCoordinate:[bldgPoint coordinate] addressDictionary:nil];
    
    MKMapItem *mapItem = [[MKMapItem alloc] initWithPlacemark:placemark];
    [mapItem setName:@"Digital Media Center"];
    NSDictionary *options = @{MKLaunchOptionsDirectionsModeKey : MKLaunchOptionsDirectionsModeDriving};
    
    // ########
    
    CLAuthorizationStatus authorizationStatus = [CLLocationManager authorizationStatus];
    
    if (authorizationStatus == kCLAuthorizationStatusAuthorizedWhenInUse){
        [self.locationManager startUpdatingLocation];
        [mapItem openInMapsWithLaunchOptions:options];
    } else if (authorizationStatus == kCLAuthorizationStatusAuthorizedAlways) {
        [self.locationManager startUpdatingLocation];
        [mapItem openInMapsWithLaunchOptions:options];
    } else if (authorizationStatus == kCLAuthorizationStatusNotDetermined) {
        [self.locationManager requestWhenInUseAuthorization];
        if (authorizationStatus == kCLAuthorizationStatusAuthorizedWhenInUse) {
            [mapItem openInMapsWithLaunchOptions:options];
        }
    } else {
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Update Settings" message:@"You may change your Privacy settings to allow this App to access your location" preferredStyle:UIAlertControllerStyleActionSheet];
        
        UIAlertAction *defaultAction = [UIAlertAction actionWithTitle:@"Settings" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString: UIApplicationOpenSettingsURLString]];
        }];
        UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action){}];
        
        [alert addAction:defaultAction];
        [alert addAction:cancelAction];
        
        [self presentViewController:alert animated:YES completion:nil];
    }

    
    // ######
    
    
    // [mapItem openInMapsWithLaunchOptions:options];

    
    
}

@end
