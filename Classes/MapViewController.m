    //
//  MapViewController.m
//  MapKitScalingAnnotation
//
//  Created by Mike Laster on 3/27/10.
//  Copyright 2010 Apple, Inc. All rights reserved.
//

#import "MapViewController.h"


#import "CustomView.h"

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

- (void)layoutSubviews {
    NSLog(@"-[%@ layoutSubview]", [self class]);
}


- (void)dealloc {
    [super dealloc];
}

- (void)dumpViewHierarchy:(UIView *)inView {
    UIView *view = inView;
    NSMutableArray *list = [NSMutableArray array];
    NSUInteger viewCount = 0;
    NSInteger i = 0;
    
    while (view != nil) {
        [list addObject:[view description]];
        view = [view superview];
    }
         
    viewCount = [list count];
    
    NSLog(@">>> dumpViewHierarchy");
    for (i = viewCount - 1; i >= 0; i--) {
        NSUInteger padSize = viewCount - i - 1;
        NSMutableString *padding = [NSMutableString string];
        
        for (NSInteger j = 0; j < padSize; j++) {
            [padding appendString:@"  "];
        }
        
        NSLog(@"%@%@", padding, [list objectAtIndex:i]);
    }
    NSLog(@"<<< dumpViewHierarchy");
}

- (void) addCircleWithCoordinate:(CLLocationCoordinate2D) inCenter
                          radius:(CGFloat) inRadius {
    MKMapView *mapView = (MKMapView *)[self view];
    UIView *anchorView = nil;
    UIScrollView *scrollView = nil;
    UIView *debugView = nil;

    NSLog(@"STUB: addCircleWithCoordinate:radius:");
    NSLog(@"center: %f/%f  radius: %f m", inCenter.latitude, inCenter.longitude, inRadius);

    // TO-DO: Figure out how to draw a circle that scales
    anchorView = [[[[[[mapView subviews] objectAtIndex:0] subviews] objectAtIndex:0] subviews] objectAtIndex:0];
    scrollView = (UIScrollView *)[anchorView superview];
    NSLog(@"anchorView: %@", anchorView);
    NSLog(@"anchorView bounds: %@", NSStringFromCGRect([anchorView bounds]));
    NSLog(@"anchorView superview bounds: %@", NSStringFromCGRect([[anchorView superview] bounds]));
    [self dumpViewHierarchy:anchorView];
    NSLog(@"scrollView: %@", scrollView);
    NSLog(@"scrollView delegate: %@", [scrollView delegate]);
    NSLog(@"scrollView subviews: %@", [scrollView subviews]);
    debugView = [[CustomView alloc] initWithFrame:CGRectMake(0.0, 0.0, 42.0, 42.0)];
    [debugView setContentMode:UIViewContentModeRedraw];
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
