//
//  MapKitScalingAnnotationAppDelegate.m
//  MapKitScalingAnnotation
//
//  Created by Mike Laster on 3/27/10.
//  Copyright Apple, Inc 2010. All rights reserved.
//

#import "MapKitScalingAnnotationAppDelegate.h"

@implementation MapKitScalingAnnotationAppDelegate

@synthesize window;
@synthesize mapViewController;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {    
    [window addSubview:[mapViewController view]];
    [window makeKeyAndVisible];
	
	return YES;
}


- (void)dealloc {
    [self setWindow:nil];
    [self setMapViewController:nil];
    [super dealloc];
}

@end
