//
//  MyQuartzView.h
//  Quartz2D
//
//  Created by makai on 12-12-13.
//  Copyright (c) 2012年 makai. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreGraphics/CoreGraphics.h>
#import <QuartzCore/QuartzCore.h>

@interface MyQuartzView : UIView
{
    CGContextRef whiteBoardContext;
    CGLayerRef whiteBoardLayer;
}

@end
