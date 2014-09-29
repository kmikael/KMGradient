//
//  KMGradient.m
//  GradientDemo
//
//  Created by Mikael Konutgan on 29/09/14.
//  Copyright (c) 2014 Mikael Konutgan. All rights reserved.
//

#import "KMGradient.h"

@interface KMGradient ()

@property (nonatomic, strong) NSArray *colors;
@property (nonatomic, strong) NSArray *locations;

@property (nonatomic, assign) CGGradientRef CGGradient;
@property (nonatomic, assign) CGColorSpaceRef CGColorSpace;

@end

@implementation KMGradient

- (instancetype)initWithColors:(NSArray *)colors locations:(NSArray *)locations
{
    self = [super init];
    if (self) {
        _colors = colors;
        _locations = locations;
        
        _CGColorSpace = CGColorSpaceCreateDeviceRGB();
        
        NSUInteger count = [colors count];
        
        NSAssert(count != 0, @"You no zero.");
        
        NSMutableArray *CGColors = [NSMutableArray arrayWithCapacity:count];
        for (UIColor *color in colors) {
            [CGColors addObject:(id)color.CGColor];
        }
        
        CGFloat *CGFloats = malloc(sizeof(CGFloat) * count);
        
        for (NSUInteger idx = 0; idx < count; ++idx) {
            CGFloats[idx] = [[locations objectAtIndex:idx] floatValue];
        }
        
        _CGGradient = CGGradientCreateWithColors(_CGColorSpace, (__bridge CFArrayRef)CGColors, CGFloats);
        
        free(CGFloats);
    }
    return self;
}

- (instancetype)init
{
    return [self initWithColors:@[[UIColor whiteColor], [UIColor blackColor]] locations:@[@0.0, @1.0]];
}

+ (instancetype)gradientWithColors:(NSArray *)colors locations:(NSArray *)locations
{
    return [[self alloc] initWithColors:colors locations:locations];
}

- (void)dealloc
{
    CGColorSpaceRelease(_CGColorSpace);
    CGGradientRelease(_CGGradient);
}

@end

@implementation KMLinearGradient

- (void)drawWithStartPoint:(CGPoint)startPoint endPoint:(CGPoint)endPoint options:(KMGradientDrawingOptions)options
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSaveGState(context);
    
    CGContextDrawLinearGradient(context, self.CGGradient, startPoint, endPoint, options);
    
    CGContextRestoreGState(context);
}

@end

@implementation KMRadialGradient

- (void)drawWithStartCenter:(CGPoint)startCenter startRadius:(CGFloat)startRadius endCenter:(CGPoint)endCenter endRadius:(CGFloat)endRadius options:(KMGradientDrawingOptions)options
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSaveGState(context);
    
    CGContextDrawRadialGradient(context, self.CGGradient, startCenter, startRadius, endCenter, endRadius, options);
    
    CGContextRestoreGState(context);
}

@end
