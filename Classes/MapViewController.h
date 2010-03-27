//
//  MapViewController.h
//  MapKitScalingAnnotation
//
//  Created by Mike Laster on 3/27/10.
//  Copyright 2010 Apple, Inc. All rights reserved.
//

@interface MapViewController : UIViewController <MKMapViewDelegate> {

}

- (void) addCircleWithCoordinate:(CLLocationCoordinate2D) inCenter
                          radius:(CGFloat) inRadius;
@end
