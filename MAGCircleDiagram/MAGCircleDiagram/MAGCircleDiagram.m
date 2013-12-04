//
//  MAGCircleDiagram.m
//  MAGCircleDiagram
//
//  Created by Ievgen Rudenko on 02/12/13.
//  Copyright (c) 2013 MadAppGang. All rights reserved.
//

#import "MAGCircleDiagram.h"

static const CFTimeInterval kAnimationDuration = 1.0;

@interface MAGCircleDiagram ()

@property (nonatomic, readonly) UIImage *backgroundImage;
@property (nonatomic, readonly) UIImage *progressImage;
@property (nonatomic, assign) CGSize preferedSize;
@property (nonatomic, assign) CGSize progressImageSize;

@property (nonatomic, strong) CALayer *progressLayer;
@property (nonatomic, strong) CAShapeLayer *testLayer;

@end

@implementation MAGCircleDiagram

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self commonInit];
    
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self commonInit];
    }
    return self;
}

- (void)commonInit {
    self.progress = 0;
    self.preferedSize = [self.backgroundImage size];
    self.progressImageSize = [self.progressImage size];
    self.layer.contents = (__bridge id)[self backgroundImage].CGImage;
    self.layer.contentsScale = self.backgroundImage.scale;
    self.layer.masksToBounds = YES;
    self.progressLayer = [CALayer new];
    self.progressLayer.contents = (__bridge id)[self progressImage].CGImage;
    self.progressLayer.contentsScale = self.layer.contentsScale;
    self.progressLayer.frame = self.bounds;
    [self.layer addSublayer:self.progressLayer];
    
    self.progressLayer.mask = [CAShapeLayer layer];
    CAShapeLayer *maskLayer = (CAShapeLayer*)self.progressLayer.mask;
    maskLayer.fillColor = [UIColor greenColor].CGColor;
    maskLayer.strokeColor = [UIColor blueColor].CGColor;
    maskLayer.lineWidth = 0;
    [self updateProgressLayer];
    
    [self setContentMode:self.contentMode];
}

- (CGSize)sizeThatFits:(CGSize)size {
    return self.preferedSize;
}

- (CGSize)intrinsicContentSize {
    return self.preferedSize;
}


- (void)setLayersContentGravity:(NSString*)gravity {
    self.layer.contentsGravity = gravity;
    self.progressLayer.contentsGravity = gravity;
    self.progressLayer.mask.contentsGravity = gravity;
}

- (void)setLayersDisplayOnBoundChange:(BOOL)change {
    self.layer.needsDisplayOnBoundsChange = change;
    self.progressLayer.needsDisplayOnBoundsChange = change;
    self.progressLayer.mask.needsDisplayOnBoundsChange = change;
}

- (void)setContentMode:(UIViewContentMode)contentMode {
    [super setContentMode:contentMode];
    [self setLayersContentGravity:kCAGravityCenter];
    [self setLayersDisplayOnBoundChange:NO];
}


- (CGFloat)startAngleForCurrentProgress {
    if (self.progress<75) {
        return 270;
    } else {
        return (270+self.progress*360/100)%360;
    }
}

- (CGFloat)endAngleForCurrentProgress {
    if (self.progress<75) {
        return (270+self.progress*360/100)%360;
    } else {
        return 270;
    }
}

- (UIBezierPath*)pathForCurrentProgress {
    CGFloat ovalStartAngle = [self startAngleForCurrentProgress];
    CGFloat ovalEndAngle = [self endAngleForCurrentProgress];
    NSLog(@"start Angle: %f, %f:  progress: %i",ovalStartAngle, ovalEndAngle,self.progress);
    UIBezierPath* ovalPath = [UIBezierPath bezierPath];
    [ovalPath addArcWithCenter:self.progressLayer.position
                        radius:self.progressImageSize.height
                    startAngle:ovalStartAngle * M_PI/180
                      endAngle:ovalEndAngle * M_PI/180
                     clockwise:YES];
    [ovalPath addLineToPoint: self.progressLayer.position];
    [ovalPath closePath];
    return ovalPath;
}

- (void)updateProgressLayer {
    ((CAShapeLayer*)self.progressLayer.mask).path = [self pathForCurrentProgress].CGPath;
}


- (void)setProgress:(NSUInteger)progress {
    if (_progress == progress) return;
    BOOL changeBackground = (_progress<=75 && progress > 75) || (_progress>=75 && progress <75);
    _progress = MIN(progress,100);
    if (changeBackground)
        self.progressLayer.contents = (__bridge id)[self progressImage].CGImage;
    [self updateProgressLayer];
}



@end
