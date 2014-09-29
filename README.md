# KMGradient

`KMGradient`is a super-easy way to draw linear or radial gradients, be it in `drawRect:` in a custom view or an image context.

![KMGradient Screenshot](http://f.cl.ly/items/1K120Z471c3I3Y2A2K0C/iOS%20Simulator%20Screen%20Shot%2029%20Sep%202014%2023.06.49.png)

## Why?

Because creating and drawing a gradient with `Core Graphics` functions is super-tedious.

## Example

```objective-c
NSArray *colors = @[[UIColor redColor], [UIColor yellowColor]];
NSArray *locations = @[@0.0, @1.0];
KMLinearGradient *gradient = [KMLinearGradient gradientWithColors:colors locations:locations];

CGPoint startPoint = CGPointMake(0.0, CGRectGetHeight(rect) / 2.0);
CGPoint endPoint = CGPointMake(CGRectGetWidth(rect), CGRectGetHeight(rect) / 2.0);
KMGradientDrawingOptions options = KMGradientDrawingOptionsDrawsAfterEndLocation | KMGradientDrawingOptionsDrawsBeforeStartLocation;
[gradient drawWithStartPoint:startPoint endPoint:endPoint options:options];
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
