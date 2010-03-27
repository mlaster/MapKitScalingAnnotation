//
//  MapKitScalingAnnotationAppDelegate.h
//  MapKitScalingAnnotation
//
//  Created by Mike Laster on 3/27/10.
//  Copyright Apple, Inc 2010. All rights reserved.
//

@class MapViewController;

@interface MapKitScalingAnnotationAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    MapViewController *mapViewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet MapViewController *mapViewController;

@end

