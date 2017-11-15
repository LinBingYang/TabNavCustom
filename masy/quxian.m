//
//  quxian.m
//  masy
//
//  Created by Admin on 16/12/15.
//  Copyright © 2016年 Admin. All rights reserved.
//

#import "quxian.h"
#import <objc/runtime.h>
@implementation quxian

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
        self.backgroundColor=[UIColor blackColor];
        //        [self setNeedsDisplay];
    }
    return self;
}
- (void)addBezierThroughPoints:(NSArray *)pointArray
{
    UIBezierPath *mPath = [UIBezierPath bezierPath];
    CGPoint previousPoint = CGPointZero;
    
    CGPoint previousCenterPoint = CGPointZero;
    CGPoint centerPoint = CGPointZero;
    CGFloat centerPointDistance = 0;
    
    CGFloat obliqueAngle = 0;
    
    CGPoint previousControlPoint1 = CGPointZero;
    CGPoint previousControlPoint2 = CGPointZero;
    CGPoint controlPoint1 = CGPointZero;
    CGPoint currentPoint = CGPointZero;
//
        NSValue * pointIValue = pointArray[0];
        currentPoint=[pointIValue CGPointValue];
        previousPoint = mPath.currentPoint;
        
    
    
    for (int i = 0; i < pointArray.count; i++) {
        
        pointIValue = pointArray[i];
        CGPoint pointI = [pointIValue CGPointValue];
        
        if (i > 0) {
            
            previousCenterPoint = CenterPointOf(mPath.currentPoint, previousPoint);
            centerPoint = CenterPointOf(previousPoint, pointI);
            
            centerPointDistance = DistanceBetweenPoint(previousCenterPoint, centerPoint);
            
            obliqueAngle = ObliqueAngleOfStraightThrough(centerPoint, previousCenterPoint);
            
            previousControlPoint2 = CGPointMake(previousPoint.x - 0.5 * self.contractionFactor * centerPointDistance * cos(obliqueAngle), previousPoint.y - 0.5 * self.contractionFactor * centerPointDistance * sin(obliqueAngle));
            controlPoint1 = CGPointMake(previousPoint.x + 0.5 * self.contractionFactor * centerPointDistance * cos(obliqueAngle), previousPoint.y + 0.5 * self.contractionFactor * centerPointDistance * sin(obliqueAngle));
        }
        
        if (i == 1) {
            [mPath moveToPoint:currentPoint]; //创建一个点
            [mPath addQuadCurveToPoint:previousPoint controlPoint:previousControlPoint2];
        }
        else if (i > 1 && i < pointArray.count - 1) {
            
            [mPath addCurveToPoint:previousPoint controlPoint1:previousControlPoint1 controlPoint2:previousControlPoint2];
        }
        if (i == pointArray.count - 1) {
            
            [mPath addCurveToPoint:previousPoint controlPoint1:previousControlPoint1 controlPoint2:previousControlPoint2];
            [mPath addQuadCurveToPoint:pointI controlPoint:controlPoint1];
        }
        else {
            
        }
        
        previousControlPoint1 = controlPoint1;
        previousPoint = pointI;
    }
    [mPath setLineWidth:3];
    [mPath stroke];
    CAShapeLayer *clay = [CAShapeLayer layer];
    clay.strokeColor = [UIColor blueColor].CGColor;
    clay.fillColor = nil;
    clay.lineWidth = 3;
    clay.path = mPath.CGPath;
    clay.lineCap = kCALineCapRound;
    [self.layer addSublayer:clay];
}

CGFloat ObliqueAngleOfStraightThrough(CGPoint point1, CGPoint point2)   //  [-π/2, 3π/2)
{
    CGFloat obliqueRatio = 0;
    CGFloat obliqueAngle = 0;
    
    if (point1.x > point2.x) {
        
        obliqueRatio = (point2.y - point1.y) / (point2.x - point1.x);
        obliqueAngle = atan(obliqueRatio);
    }
    else if (point1.x < point2.x) {
        
        obliqueRatio = (point2.y - point1.y) / (point2.x - point1.x);
        obliqueAngle = M_PI + atan(obliqueRatio);
    }
    else if (point2.y - point1.y >= 0) {
        
        obliqueAngle = M_PI/2;
    }
    else {
        obliqueAngle = -M_PI/2;
    }
    
    return obliqueAngle;
}

CGPoint ControlPointForTheBezierCanThrough3Point(CGPoint point1, CGPoint point2, CGPoint point3)
{
    return CGPointMake(2 * point2.x - (point1.x + point3.x) / 2, 2 * point2.y - (point1.y + point3.y) / 2);
}

CGFloat DistanceBetweenPoint(CGPoint point1, CGPoint point2)
{
    return sqrt((point1.x - point2.x) * (point1.x - point2.x) + (point1.y - point2.y) * (point1.y - point2.y));
}

CGPoint CenterPointOf(CGPoint point1, CGPoint point2)
{
    return CGPointMake((point1.x + point2.x) / 2, (point1.y + point2.y) / 2);
}
- (CGFloat)contractionFactor
{
    id contractionFactorAssociatedObject = objc_getAssociatedObject(self, @selector(contractionFactor));
    if (contractionFactorAssociatedObject == nil) {
        return 1;
    }
    return [contractionFactorAssociatedObject floatValue];
}
- (void)setContractionFactor:(CGFloat)contractionFactor
{
    objc_setAssociatedObject(self, @selector(contractionFactor), @(contractionFactor), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
@end
