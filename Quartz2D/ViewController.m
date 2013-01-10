//
//  ViewController.m
//  Quartz2D
//
//  Created by makai on 12-12-13.
//  Copyright (c) 2012年 makai. All rights reserved.
//

#import "ViewController.h"
#import "MyQuartzView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
//    MyQuartzView *view = [[MyQuartzView alloc] init];
//    self.view = view;

    image = [UIImage imageNamed:@"tiger1"];
    CGImageRef imageRef = image.CGImage;
    width = CGImageGetWidth(imageRef);
    height = CGImageGetHeight(imageRef);
    
    layer = [CALayer layer];
    [layer setPosition:CGPointMake(width / 2, height / 2)];
    [layer setBounds:CGRectMake(0, 0, width, height)];
    [layer setContents:(id)imageRef];
//    [layer setOpacity:0.2];
    //    [layer setDelegate:self];
    //    [layer setContentsGravity:kCAGravityTopRight];
    [self.view.layer addSublayer:layer];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [button setFrame:CGRectMake(10, 300, 100, 40)];
    [button setTitle:@"position" forState:UIControlStateNormal];
    [self.view addSubview:button];
    [button addTarget:self action:@selector(setPosition) forControlEvents:UIControlEventTouchDown];

}

 -(id<CAAction>)actionForLayer:(CALayer *)layer forKey:(NSString *)event
{
    CATransition *theAnimation=nil;
    
    if ([event isEqualToString:@"contents"])
    {
        
        theAnimation = [[CATransition alloc] init];
        theAnimation.duration = 1.0;
        theAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
        theAnimation.type = kCATransitionPush;
        theAnimation.subtype = kCATransitionFromRight;
    
    }
    
    return theAnimation;
}

- (void)setPosition
{
    CGPoint fromPoint = layer.position;
    
    //曲线路径
    UIBezierPath *bezier = [UIBezierPath bezierPath];
    [bezier moveToPoint:fromPoint];
    CGPoint toPoint = CGPointMake(500, 700);
    [bezier addQuadCurveToPoint:toPoint controlPoint:CGPointMake(toPoint.x, fromPoint.y)];
    
    //关键帧
    CAKeyframeAnimation *keyFrameAnimation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    [keyFrameAnimation setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut]];
    [keyFrameAnimation setPath:bezier.CGPath];
    [keyFrameAnimation setRemovedOnCompletion:YES];
//    [keyFrameAnimation setDuration:2];
//    [layer addAnimation:keyFrameAnimation forKey:@"keyFrameAnimation"];
    
    //旋转变化
    CABasicAnimation *basicAnimation = [CABasicAnimation animationWithKeyPath:@"transform"];
    [basicAnimation setDuration:1];
    [basicAnimation setFromValue:[NSValue valueWithCATransform3D:CATransform3DIdentity]];
    [basicAnimation setToValue:[NSValue valueWithCATransform3D:CATransform3DMakeRotation(M_PI, 0, 0, 1)]];
    [basicAnimation setRepeatCount:2];
    [basicAnimation setCumulative:YES];
    [basicAnimation setRemovedOnCompletion:YES];
//    [layer addAnimation:basicAnimation forKey:@"basicAnimation"];
    
    //透明变化
    CABasicAnimation *opacityAnim = [CABasicAnimation animationWithKeyPath:@"alpha"];
    [opacityAnim setFromValue:[NSNumber numberWithFloat:1.0]];
    [opacityAnim setToValue:[NSNumber numberWithFloat:0.1]];
    [opacityAnim setRemovedOnCompletion:YES];
    
    //图片边缘加一个像素的透明区域，去图片锯齿
    CGRect imageRect = CGRectMake(0, 0, width, height);
    UIGraphicsBeginImageContext(imageRect.size);
    [image drawInRect:CGRectMake(3, 3, width - 6, height - 6)];
    image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    

    CAAnimationGroup *animationGroup = [CAAnimationGroup animation];
    [animationGroup setDuration:4];
    [animationGroup setAnimations:[NSArray arrayWithObjects:keyFrameAnimation, basicAnimation, opacityAnim, nil]];
//    [layer addAnimation:animationGroup forKey:nil];
    
    
//    [CATransaction begin];
//    [CATransaction setValue:[NSNumber numberWithFloat:2] forKey:kCATransactionAnimationDuration];
//    [layer setOpacity:1];
//    [layer setPosition:CGPointMake(width, height)];
//        [CATransaction begin];
//        [CATransaction setValue:[NSNumber numberWithFloat:10] forKey:kCATransactionAnimationDuration];
//        [layer setBounds:CGRectMake(200, 200, width, height)];
//    
//        [CATransaction commit];
//    [CATransaction commit];
    
    
    //显示动画
//    CABasicAnimation *theAnimation;
//    
//    theAnimation=[CABasicAnimation animationWithKeyPath:@"opacity"];
//    theAnimation.duration=2.0;
//    theAnimation.repeatCount=2;
//    theAnimation.autoreverses=YES;
//    theAnimation.fromValue=[NSNumber numberWithFloat:1.0];
//    theAnimation.toValue=[NSNumber numberWithFloat:0.0];
//    [layer addAnimation:theAnimation forKey:@"animateOpacity"];
//
//    CIFilter *filter = [CIFilter filterWithName:@"CIBloom"];
//    [filter setDefaults];
//    [filter setValue:[NSNumber numberWithFloat:5.0] forKey:@"inputRadius"];
//    
//    // name the filter so we can use the keypath to animate the inputIntensity
//    // attribute of the filter
////    [filter setName:@"pulseFilter"];
//    
//    // set the filter to the selection layer's filters
//    [layer setFilters:[NSArray arrayWithObject:filter]];
//    
//    // create the animation that will handle the pulsing.
//    CABasicAnimation* pulseAnimation = [CABasicAnimation animation];
//    
//    // the attribute we want to animate is the inputIntensity
//    // of the pulseFilter
//    pulseAnimation.keyPath = @"filters.pulseFilter.inputIntensity";
//    
//    // we want it to animate from the value 0 to 1
//    pulseAnimation.fromValue = [NSNumber numberWithFloat: 0.0];
//    pulseAnimation.toValue = [NSNumber numberWithFloat: 1.5];
//    
//    // over a one second duration, and run an infinite
//    // number of times
//    pulseAnimation.duration = 1.0;
//    pulseAnimation.repeatCount = HUGE_VALF;
//    
//    // we want it to fade on, and fade off, so it needs to
//    // automatically autoreverse.. this causes the intensity
//    // input to go from 0 to 1 to 0
//    pulseAnimation.autoreverses = YES;
//    
//    // use a timing curve of easy in, easy out..
//    pulseAnimation.timingFunction = [CAMediaTimingFunction functionWithName: kCAMediaTimingFunctionEaseInEaseOut];
//    
//    // add the animation to the selection layer. This causes
//    // it to begin animating. We'll use pulseAnimation as the
//    // animation key name
//    [layer addAnimation:pulseAnimation forKey:@"pulseAnimation"];
}


@end
