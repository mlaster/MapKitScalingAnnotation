    //
//  MapViewController.m
//  MapKitScalingAnnotation
//
//  Created by Mike Laster on 3/27/10.
//  Copyright 2010 Apple, Inc. All rights reserved.
//

#import "MapViewController.h"


@implementation MapViewController

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    CLLocationCoordinate2D coord;
    MKCoordinateSpan span = {};
    MKCoordinateRegion region = {};
    MKMapView *mapView = (MKMapView *)[self view];

    span.longitudeDelta = 0.05;
    span.latitudeDelta = 0.05;
    coord.latitude = 37.331786;
    coord.longitude = -122.030157;
    region.span = span;
    region.center = coord;
    region = [mapView regionThatFits:region];
    [mapView setRegion:region];
    [self addCircleWithCoordinate:coord radius:1000.0];
}

- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];
}

- (void) addCircleWithCoordinate:(CLLocationCoordinate2D) inCenter
                          radius:(CGFloat) inRadius {
    NSLog(@"STUB: addCircleWithCoordinate:radius:");
    NSLog(@"center: %f/%f  radius: %f m", inCenter.latitude, inCenter.longitude, inRadius);
    // TO-DO: Figure out how to draw a circle that scales
}

@end
