//
//  GradientView.m
//  GradientDemo
//
//  Created by Mikael Konutgan on 29/09/14.
//  Copyright (c) 2014 Mikael Konutgan. All rights reserved.
//

#import "GradientView.h"
#import "KMGradient.h"

@implementation GradientView

- (void)drawRect:(CGRect)rect
{
    NSArray *colors = @[[UIColor redColor], [UIColor yellowColor]];
    NSArray *locations = @[@0.0, @1.0];
    KMLinearGradient *gradient = [KMLinearGradient gradientWithColors:colors locations:locations];
    
    CGPoint startPoint = CGPointMake(0.0, CGRectGetHeight(rect) / 2.0);
    CGPoint endPoint = CGPointMake(CGRectGetWidth(rect), CGRectGetHeight(rect) / 2.0);
    KMGradientDrawingOptions options = KMGradientDrawingOptionsDrawsAfterEndLocation | KMGradientDrawingOptionsDrawsBeforeStartLocation;
    [gradient drawWithStartPoint:startPoint endPoint:endPoint options:options];
}

@end
