//
//  ViewController.h
//  Quartz2D
//
//  Created by makai on 12-12-13.
//  Copyright (c) 2012年 makai. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import <CoreGraphics/CoreGraphics.h>

@interface ViewController : UIViewController
{
    CALayer *layer;
    size_t width;
    size_t height;
    UIImage *image;
}

@end
