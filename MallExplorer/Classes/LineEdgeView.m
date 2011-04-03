//
//  LineEdgeView.m
//  Falling Bricks
//
//  Created by Tran Cong Hoang on 4/4/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "LineEdgeView.h"


@implementation LineEdgeView
@synthesize startPoint;
@synthesize goalPoint;

- (id)initWithPoint1:(CGPoint)point1 andPoint2:(CGPoint) point2 {
    double x = fmin(point1.x, point2.x);
    double y = fmin(point1.y, point2.y);
	double w = fabs(point1.x - point2.x);
	double h = fabs(point1.y - point2.y);
    self = [super initWithFrame:CGRectMake(x, y, w, h)];
    if (self) {
        // Initialization code.
		startPoint = point1;
		goalPoint = point2;
    }
	self.backgroundColor = [UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.0];
    return self;
}

-(void) adjustFrameToPoint1:(CGPoint)point1 andPoint2:(CGPoint) point2 {
    double x = fmin(point1.x, point2.x);
    double y = fmin(point1.y, point2.y);
	double w = fabs(point1.x - point2.x);
	double h = fabs(point1.y - point2.y);
    self.frame = CGRectMake(x, y, w, h);
    if (self) {
        // Initialization code.
		startPoint = point1;
		goalPoint = point2;
    }
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.


- (void)drawRect:(CGRect)rect {
	CGContextRef contextRef = UIGraphicsGetCurrentContext();
    CGFloat red[4] = {1.0f, 0.0f, 0.0f, 1.0f};
    CGContextSetStrokeColor(contextRef, red);
    CGContextBeginPath(contextRef);
	double x = self.frame.origin.x;
	double y = self.frame.origin.y;
    CGContextMoveToPoint(contextRef, startPoint.x-x, startPoint.y-y);
    CGContextAddLineToPoint(contextRef, goalPoint.x-x, goalPoint.y-y);
    CGContextStrokePath(contextRef);
}

- (void)dealloc {
    [super dealloc];
}

@end
