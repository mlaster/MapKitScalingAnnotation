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

    // zoom the map onto Cupertino
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
    MKMapView *mapView = (MKMapView *)[self view];
    UIView *anchorView = nil;
    UIView *debugView = nil;

    NSLog(@"STUB: addCircleWithCoordinate:radius:");
    NSLog(@"center: %f/%f  radius: %f m", inCenter.latitude, inCenter.longitude, inRadius);
    // TO-DO: Figure out how to draw a circle that scales

    anchorView = [[[[[[mapView subviews] objectAtIndex:0] subviews] objectAtIndex:0] subviews] objectAtIndex:0];
    NSLog(@"anchorView: %@", anchorView);
    NSLog(@"anchorView bounds: %@", NSStringFromCGRect([anchorView bounds]));
    NSLog(@"anchorView superview bounds: %@", NSStringFromCGRect([[anchorView superview] bounds]));

    debugView = [[UIView alloc] initWithFrame:CGRectMake(0.0, 0.0, 42.0, 42.0)];
    [debugView setBackgroundColor:[[UIColor redColor] colorWithAlphaComponent:0.5]];
    NSLog(@"debugView: %@", debugView);
    
    [anchorView addSubview:debugView];
    CGRect rect = [[anchorView superview] convertRect:[[anchorView superview] bounds] toView:anchorView];
    NSLog(@"rect: %@", NSStringFromCGRect(rect));
    NSLog(@"BEFORE debugView: %@", debugView);
    [debugView setFrame:rect];
    NSLog(@"AFTER debugView: %@", debugView);
    NSLog(@"debugView layer: %@", NSStringFromCGRect([[debugView layer] frame]));
    
}

@end
