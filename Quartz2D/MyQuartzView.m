//
//  MyQuartzView.m
//  Quartz2D
//
//  Created by makai on 12-12-13.
//  Copyright (c) 2012年 makai. All rights reserved.
//

#import "MyQuartzView.h"

static inline double radians(double degrees) {return degrees * M_PI/180;}

@implementation MyQuartzView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.backgroundColor = [UIColor whiteColor];
        self.opaque = 0.5;
        
//        CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
//        whiteBoardContext = CGBitmapContextCreate(NULL, self.frame.size.width, self.frame.size.height, 8, 4 * self.frame.size.width, colorSpace, kCGImageAlphaPremultipliedFirst);
//        CGColorSpaceRelease(colorSpace);
//        
//        whiteBoardLayer = CGLayerCreateWithContext(whiteBoardContext, self.frame.size, NULL);
//        CGContextRef layerContext = CGLayerGetContext(whiteBoardLayer);
//        
//        CGContextSetLineWidth(layerContext, 10);
//        CGContextSetLineCap(layerContext, kCGLineCapRound);
//        CGContextSetRGBStrokeColor(layerContext, 0, 1, 0, 1);
    }
    return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    NSLog(@"%@", NSStringFromSelector(_cmd));
//    CGContextRef currentContext = UIGraphicsGetCurrentContext();
//    CGImageRef image = CGBitmapContextCreateImage(whiteBoardContext);
//    CGContextDrawImage(currentContext, [self bounds], image);
//    CGContextDrawLayerInRect(currentContext, [self bounds], whiteBoardLayer);
    
    /*
    //没有边框的正方形
    CGContextSetRGBFillColor(context, 0, 0.25, 0, 0.5);
    CGContextFillRect(context, CGRectMake(2, 2, 10, 10));
    CGContextStrokePath(context);
    
    //正方形边框
    CGContextSetRGBStrokeColor(context, 0, 0, 0, 0.5);
    CGContextSetLineWidth(context, 2.0);
    CGContextAddRect(context, CGRectMake(2, 2, 10, 10));
    CGContextStrokePath(context);
    
    //写文字
    CGContextSetLineWidth(context, 0.5);
    CGContextSetRGBFillColor(context, 0, 0, 0, 1.0);
    UIFont *font = [UIFont boldSystemFontOfSize:11.0];
    [@"Quartz 2D，干掉你！" drawInRect:CGRectMake(20, 0, 150, 20) withFont:font];
    
    //一条直线
    CGContextSetRGBStrokeColor(context, 0.5, 0.5, 0.5, 1);
    CGContextMoveToPoint(context, 0, 20);
    CGContextAddLineToPoint(context, 150, 20);
    CGContextStrokePath(context);
    */
    //画方形背景颜色
    /*
    CGContextTranslateCTM(context, 0.0f, self.bounds.size.height);
    CGContextScaleCTM(context, 1.0f, -1.0f);
    UIGraphicsPushContext(context);
    CGContextSetLineWidth(context,320);
    CGContextSetRGBStrokeColor(context, 250.0/255, 250.0/255, 210.0/255, 1.0);
    CGContextStrokeRect(context, CGRectMake(0, 0, 320, 460));
    UIGraphicsPopContext();
     */
    
    /*
    //画线
    CGContextSetRGBStrokeColor(context, 1, 0, 0, 1);
    CGContextSetLineWidth(context, 1);
    CGPoint points[5];
    points[0] = CGPointMake(150, 5);
    points[1] = CGPointMake(300, 5);
    points[2] = CGPointMake(300, 20);
    points[3] = CGPointMake(150, 20);
    points[4] = CGPointMake(150, 5);
    CGContextAddLines(context, points, 5);
//    CGContextDrawPath(context, kCGPathStroke);
    CGContextStrokePath(context);
    
    //椭圆
    CGRect aRect = CGRectMake(0, 20, 100, 70);
    CGContextSetRGBStrokeColor(context, 1, 0, 0, 1);
    CGContextSetRGBFillColor(context, 0, 0.6, 0.9, 1);
    CGContextSetLineWidth(context, 2);
    CGContextAddEllipseInRect(context, aRect);
    CGContextStrokePath(context);
    
    //弧线
    CGContextBeginPath(context);
    CGContextMoveToPoint(context, 100, 100);
    CGContextSetRGBStrokeColor(context, 0, 1, 0, 1);
    CGContextAddArcToPoint(context, 50, 100, 50, 150, 20);
    CGContextMoveToPoint(context, 100, 100);
    CGContextAddLineToPoint(context, 50, 100);
    CGContextAddLineToPoint(context, 50, 150);
    CGContextStrokePath(context);
    
    //曲线 交叉曲线
    CGContextMoveToPoint(context, 200, 200);
    CGContextSetRGBStrokeColor(context, 0, 0, 1, 1);
    CGContextAddCurveToPoint(context, 100, 250, 250, 330, 200, 400);
    CGContextMoveToPoint(context, 200, 200);
    CGContextAddCurveToPoint(context, 300, 250, 150, 330, 200, 400);
    CGContextStrokePath(context);
    
    //曲线单方向
    CGContextMoveToPoint(context, 100, 100);
    CGContextSetRGBStrokeColor(context, 0, 0, 1, 1);
    CGContextSetLineWidth(context, 1);
    CGContextAddQuadCurveToPoint(context, 100, 0, 200, 100);
    CGContextAddLineToPoint(context, 100, 100);
    CGContextSetRGBFillColor(context, 1, 0, 0, 0.5);
    CGContextStrokePath(context);
    CGContextClosePath(context);
    CGContextFillPath(context);
    
    //path对象
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathMoveToPoint(path, &CGAffineTransformIdentity, 150, 150);
    CGPathAddLineToPoint(path, &CGAffineTransformIdentity, 300, 150);
    CGPathAddLineToPoint(path, &CGAffineTransformIdentity, 300, 200);
    CGPathCloseSubpath(path);
    CGContextSetLineWidth(context, 2);
    CGContextSetRGBStrokeColor(context, 0, 1, 1, 1);
    CGContextAddPath(context, path);
    CGContextSetLineJoin(context, kCGLineJoinRound);
    CGContextSetLineCap(context, kCGLineCapRound);
    CGContextStrokePath(context);
    CGPathRelease(path);
    
    //CGContextStrokeLineSegments
    CGContextBeginPath(context);
//    CGContextMoveToPoint(context, 0, 100);
//    CGContextAddLineToPoint(context, 100, 150);
//    CGContextMoveToPoint(context, 0, 150);
//    CGContextAddLineToPoint(context, 150, 200);
    CGPoint apoints[5];
    apoints[0] = CGPointMake(0, 100);
    apoints[1] = CGPointMake(100, 150);
    apoints[2] = CGPointMake(0, 150);
    apoints[3] = CGPointMake(100, 200);

    CGContextSetRGBStrokeColor(context, 0, 1, 1, 1);
    CGContextSetLineWidth(context, 2);
    CGContextStrokeLineSegments(context, apoints, 4);
    */
    //圆
//    CGContextBeginPath(context);
//    CGContextSetShadowWithColor(context, CGSizeMake(10, 7), 5, [UIColor colorWithRed:0 green:1 blue:0 alpha:.5].CGColor);
//    CGContextSetRGBFillColor(context, 1, 0, 0, 1);
//    CGContextAddArc(context, 200, 200, 50, 0, 2*3.14, 0);
//    CGContextFillPath(context);
    /*
    CGRect bounds = [self bounds];
    // Where is its center?
    CGPoint center;
    center.x = bounds.origin.x + bounds.size.width / 2.0;
    center.y = bounds.origin.y + bounds.size.height / 2.0;
    // From the center how far out to a corner?
    float maxRadius = hypot(bounds.size.width, bounds.size.height) / 2.0;
    // Get the context being drawn upon
//    CGContextRef context = UIGraphicsGetCurrentContext();
    // All lines will be drawn 10 points wide
    CGContextSetLineWidth(context, 2);
    // Set the stroke color to light gray
    [[UIColor lightGrayColor] setStroke];
    // Draw concentric circles from the outside in
    for (float currentRadius = maxRadius; currentRadius > 0; currentRadius -= 4)
    {
        CGContextAddArc(context, center.x, center.y,
                        currentRadius, 0.0, M_PI * 2.0, YES);
        CGContextStrokePath(context);
    }
    */
    //渐变
//    CGFloat locations[2] = {0.0, 1.0};
//    CGFloat components[12] = {0.0, 0.0, 0.0, 1.0, 1.0, 1.0, 1.0, 1.0};
//    size_t num_locations = 2;
//    CGGradientRef gradient = CGGradientCreateWithColorComponents(CGColorSpaceCreateDeviceRGB(), components, locations, num_locations);
//    CGPoint startPoint = CGPointMake(160, 0);
//    CGPoint endPoint = CGPointMake(160, 50);
//    CGContextDrawLinearGradient(context, gradient, startPoint, endPoint, 0);
//    CGGradientRelease(gradient);
    
    /*
    //透明层
    CGContextSetShadow(context, CGSizeMake(15, 10), 10);
    CGContextBeginTransparencyLayer(context, NULL);
    CGContextSetRGBFillColor(context, 0, 1, 0, 1);
    CGContextFillRect(context, CGRectMake(150, 100, 100, 100));
    CGContextSetRGBFillColor(context, 0, 0, 1, 1);
    CGContextFillRect(context, CGRectMake(100, 150, 100, 100));
    CGContextSetRGBFillColor(context, 1, 0, 0, 1);
    CGContextFillRect(context, CGRectMake(50, 200, 100, 100));
    CGContextEndTransparencyLayer(context);
    */
//    UIImage *image = [UIImage imageNamed:@"tiger"];
//    UIImageView *imageVieew = [[UIImageView alloc] initWithImage:image];
//    [imageVieew setFrame:CGRectMake(0, 0, image.size.width/2, image.size.height/2)];
//    [self addSubview:imageVieew];
//    CGDataProviderRef dataProvider = CGDataProviderCreateWithFilename([@"tiger.png" UTF8String]);
////    CGImageRef subImage = CGImageMaskCreate(200, 200, 2, 2, 2, dataProvider, 0, YES);
//    CGImageRef subImage = CGImageCreateWithMask(<#CGImageRef image#>, <#CGImageRef mask#>)
//    CGContextDrawImage(context, CGRectMake(0, 100, 200, 200), subImage);
    
    
//    CGContextRef context = UIGraphicsGetCurrentContext();
    UIImage *image = [UIImage imageNamed:@"tiger1"];
    CGImageRef imageRef = image.CGImage;
    size_t width = CGImageGetWidth(imageRef);
    size_t height = CGImageGetHeight(imageRef);

    CALayer *layer = [CALayer layer];
    [layer setPosition:CGPointMake(width / 2, height / 2)];
    [layer setBounds:CGRectMake(0, 0, width, height)];
    [layer setContents:imageRef];
//    [layer setDelegate:self];
//    [layer setContentsGravity:kCAGravityTopRight];
    [self.layer addSublayer:layer];
    
//    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
//    CGContextRef offScreenContext = CGBitmapContextCreate(NULL, width, height,CGImageGetBitsPerComponent(imageRef), CGImageGetBytesPerRow(imageRef), colorSpace, kCGImageAlphaPremultipliedLast);
    
//    CGContextDrawImage(context, CGRectMake(0, 0, width, height), imageRef);
//    
//    CGImageRef masked = CGImageMaskCreate(width, height, CGImageGetBitsPerComponent(imageRef), CGImageGetBitsPerPixel(imageRef), CGImageGetBytesPerRow(imageRef), CGImageGetDataProvider(imageRef), NULL, false);
//    CGContextClipToMask(context, CGRectMake(0, 0, width, height), masked);
//    CGImageRelease(masked);
    
    
//    CGImageRef sourceImage = [UIImage imageNamed:@"tiger1.png"].CGImage;
//    size_t width = CGImageGetWidth(sourceImage);
//    size_t height = CGImageGetHeight(sourceImage);
//    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
//    CGContextRef screenContext = CGBitmapContextCreate(NULL, width, height, 8, 0, colorSpace, kCGImageAlphaPremultipliedLast);
//    if (screenContext != NULL) {
//        CGContextDrawImage(screenContext, CGRectMake(0, 0, width, height), sourceImage);
//        sourceImage = CGBitmapContextCreateImage(screenContext);
//    }
//    CGColorSpaceRelease(colorSpace);
//
//    CGImageRef maskImage = [UIImage imageNamed:@"tiger2.png"].CGImage;
//    CGImageRef mask = CGImageMaskCreate(CGImageGetWidth(maskImage), CGImageGetHeight(maskImage), CGImageGetBitsPerComponent(maskImage), CGImageGetBitsPerPixel(maskImage), CGImageGetBytesPerRow(maskImage), CGImageGetDataProvider(maskImage), NULL, false);
    
//    CGImageRef imageWithAlpha = sourceImage;
//    if (CGImageGetAlphaInfo(sourceImage) == kCGImageAlphaNone) {
//        imageWithAlpha = [self ]
//    }
    
    //mask
    /*
    CGImageRef sourceImage = [UIImage imageNamed:@"tiger1.png"].CGImage;
    CGImageRef mask = [UIImage imageNamed:@"tiger2.png"].CGImage;
    CGImageRef maskImage = CGImageMaskCreate(CGImageGetWidth(mask), CGImageGetHeight(mask), CGImageGetBitsPerComponent(mask), CGImageGetBitsPerPixel(mask), CGImageGetBytesPerRow(mask), CGImageGetDataProvider(mask), NULL, false);
    CGImageRef maskedImage = CGImageCreateWithMask(sourceImage, maskImage);
//    CGImageRef maskedImage = CGImageCreateWithMask(sourceImage, mask);
    CGContextDrawImage(context, CGRectMake(0, 0, CGImageGetWidth(maskedImage) / 2, CGImageGetHeight(maskedImage) / 2), maskedImage);
    */
    /*
    CGContextBeginPath(context);
    CGContextSetRGBFillColor(context, 0, 1, 0, 0.5);
    CGContextAddEllipseInRect(context, CGRectMake(0, 200, 100, 300));
    CGContextAddEllipseInRect(context, CGRectMake(0, 200, 150, 350));
    CGContextFillPath(context);
    
    CGContextBeginPath (context);
    CGContextAddArc (context, 50, 500, 120, 120, 2*3.1416, 0);
    CGContextClosePath (context);
     
    CGContextClip (context);
    */
//    UIImage *image = [UIImage imageNamed:@"logo.png"];
//    UIImageView *imageVieew = [[UIImageView alloc] initWithImage:image];
//    [imageVieew setFrame:CGRectMake(50, 50, image.size.width/2, image.size.height/2)];
//    [self addSubview:imageVieew];
//    CGAffineTransform rotation = CGAffineTransformMakeRotation(radians(180));
//    CGAffineTransformRotate(imageVieew.transform, radians(180));
//    [imageVieew setTransform:rotation];
    
    //变换
//    CGContextTranslateCTM(context, 200, 300);
//    CGContextScaleCTM(context, 0.5, 0.5);
//    CGContextRotateCTM(context, radians(-180));
//    CGContextDrawImage(context, CGRectMake(0, 0, image.size.width/2, image.size.height/2), image.CGImage);
    
    
}

- (void)displayLayer:(CALayer *)layer
{
    
}

- (void)drawLayer:(CALayer *)layer inContext:(CGContextRef)ctx
{
    
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *theTouch = [touches anyObject];
    if ([theTouch tapCount] == 2) {
        CGContextClearRect(whiteBoardContext, [self bounds]);
        [self setNeedsDisplay];
    }else
        [self touchesMoved:touches withEvent:event];
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *theTouch= [touches anyObject];
    CGPoint currentTouchLocation = [theTouch locationInView:self];
    CGPoint lastTouchLocation = [theTouch previousLocationInView:self];
    CGContextRef layerContext = CGLayerGetContext(whiteBoardLayer);
    CGContextBeginPath(layerContext);
    CGContextMoveToPoint(layerContext, lastTouchLocation.x, lastTouchLocation.y);
    CGContextAddLineToPoint(layerContext, currentTouchLocation.x, currentTouchLocation.y);
    CGContextStrokePath(layerContext);
    
    [self setNeedsDisplay];
}


@end
