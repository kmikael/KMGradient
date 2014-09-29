//
//  KMGradient.h
//  GradientDemo
//
//  Created by Mikael Konutgan on 29/09/14.
//  Copyright (c) 2014 Mikael Konutgan. All rights reserved.
//

@import UIKit;

typedef NS_OPTIONS(uint32_t, KMGradientDrawingOptions) {
    KMGradientDrawingOptionsDrawsBeforeStartLocation = kCGGradientDrawsBeforeStartLocation,
    KMGradientDrawingOptionsDrawsAfterEndLocation = kCGGradientDrawsAfterEndLocation
};

@interface KMGradient : NSObject

+ (instancetype)gradientWithColors:(NSArray *)colors locations:(NSArray *)locations;

@property (nonatomic, readonly) NSArray *colors;
@property (nonatomic, readonly) NSArray *locations;

@property (nonatomic, readonly) CGGradientRef CGGradient;
- (CGGradientRef)CGGradient NS_RETURNS_INNER_POINTER CF_RETURNS_NOT_RETAINED;

@end

@interface KMLinearGradient : KMGradient

- (void)drawWithStartPoint:(CGPoint)startPoint endPoint:(CGPoint)endPoint options:(KMGradientDrawingOptions)options;

@end

@interface KMRadialGradient : KMGradient

- (void)drawWithStartCenter:(CGPoint)startCenter startRadius:(CGFloat)startRadius endCenter:(CGPoint)endCenter endRadius:(CGFloat)endRadius options:(KMGradientDrawingOptions)options;

@end
