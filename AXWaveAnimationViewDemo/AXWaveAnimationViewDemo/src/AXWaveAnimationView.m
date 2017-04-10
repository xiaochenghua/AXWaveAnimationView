//
//  AXWaveAnimationView.m
//
//  Created by arnoldxiao on 8/22/16.
//  Copyright © 2016 arnoldxiao. All rights reserved.
//

#import "AXWaveAnimationView.h"

typedef NS_ENUM(NSInteger, AXWaveAnimationStatus) {
    AXWaveAnimationStatusRemoved,
    AXWaveAnimationStatusAnimating,
    AXWaveAnimationStatusPaused
};

@interface AXWaveAnimationView ()
{
    //  波峰、周期、水平移动、垂直移动
    CGFloat amplitude, cycle, offsetX, offsetY;
}
@property (nonatomic, strong) CAShapeLayer *shapeLayer;
@property (nonatomic, strong) CADisplayLink *displayLink;
@property (nonatomic, assign) AXWaveAnimationStatus animationStatus;
@property (nonatomic, assign) CGColorRef fillColor;
@end

@implementation AXWaveAnimationView

- (instancetype)initWithFrame:(CGRect)frame
              backgroundColor:(UIColor *)backgroundColor
                    fillColor:(UIColor *)fillColor
                     autoPlay:(BOOL)autoPlay {
    if (self = [self initWithFrame:frame]) {
        if (autoPlay) {
            [self startWaveAnimation];
        }
        self.backgroundColor = backgroundColor;
        self.fillColor = fillColor.CGColor;
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self setUp];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super initWithCoder:aDecoder]) {
        [self setUp];
    }
    return self;
}

- (void)setUp {
    self.backgroundColor = [UIColor clearColor];
    
    //  初始值
    amplitude = 7;
    cycle = 1.2 * M_PI / self.frame.size.width;
    offsetX = 0;
    offsetY = self.frame.size.height * 0.95;
}

- (void)startWaveAnimation {
    switch (self.animationStatus) {
        case AXWaveAnimationStatusAnimating: {
            return;
        }
        case AXWaveAnimationStatusPaused: {
            _displayLink.paused = NO;
            break;
        }
        case AXWaveAnimationStatusRemoved: {
            offsetX = 0;
            [_displayLink invalidate];
            _displayLink = [CADisplayLink displayLinkWithTarget:self selector:@selector(displayLinkRefresh:)];
            [_displayLink addToRunLoop:[NSRunLoop currentRunLoop] forMode:NSRunLoopCommonModes];
            break;
        }
    }
    self.animationStatus = AXWaveAnimationStatusAnimating;
}

- (void)pauseWaveAnimation {
    if (self.animationStatus != AXWaveAnimationStatusAnimating) {
        return;
    }
    _displayLink.paused = YES;
    self.animationStatus = AXWaveAnimationStatusPaused;
}

- (void)removeWaveAnimation {
    if (self.animationStatus == AXWaveAnimationStatusRemoved) {
        return;
    }
    [_displayLink invalidate];
    _displayLink = nil;
    self.animationStatus = AXWaveAnimationStatusRemoved;
}

- (void)drawRect:(CGRect)rect {
    CGMutablePathRef path = CGPathCreateMutable();
    float y = offsetY;
    CGPathMoveToPoint(path, nil, 0, y);
    
    for (float x = 0.0f; x <=  self.frame.size.width; x++) {
        y = amplitude * sin(cycle * x + offsetX) + offsetY;
        CGPathAddLineToPoint(path, nil, x, y);
    }
    
    CGPathAddLineToPoint(path, nil, self.frame.size.width, self.frame.size.height);
    CGPathAddLineToPoint(path, nil, 0, self.frame.size.height);
    CGPathCloseSubpath(path);
    
    self.shapeLayer.path = path;
    CGPathRelease(path);
}

- (void)displayLinkRefresh:(CADisplayLink *)displayLink {
    offsetX += 0.02;
    [self setNeedsDisplay];
}

- (CAShapeLayer *)shapeLayer {
    if (!_shapeLayer) {
        _shapeLayer = [CAShapeLayer layer];
        _shapeLayer.fillColor = self.fillColor;
        [self.layer addSublayer:_shapeLayer];
    }
    return _shapeLayer;
}

@end
