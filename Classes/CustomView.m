//
//  CustomView.m
//  MapKitScalingAnnotation
//
//  Created by Mike Laster on 3/27/10.
//  Copyright 2010 Apple, Inc. All rights reserved.
//

#import "CustomView.h"


@implementation CustomView

- (void)xdrawRect:(CGRect)rect {
#if 1
    CGContextRef context = UIGraphicsGetCurrentContext();
    NSLog(@"TRACE: -[%@ drawRect:%@]", [self class], NSStringFromCGRect(rect));
    
    // debug. Draw the line around our view.
    CGContextSetStrokeColorWithColor(context, [[UIColor redColor] CGColor]);
    CGContextSetFillColorWithColor(context, [[[UIColor redColor] colorWithAlphaComponent:0.50] CGColor]);
    CGContextMoveToPoint(context, 0, 0);
    CGContextAddLineToPoint(context, 0, self.frame.size.height);
    CGContextAddLineToPoint(context, self.frame.size.width, self.frame.size.height);
    CGContextAddLineToPoint(context, self.frame.size.width, 0);
    CGContextAddLineToPoint(context, 0, 0);
    CGContextFillPath(context);
#endif
}


@end
