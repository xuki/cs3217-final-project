//
//  LineEdgeView.h
//  Falling Bricks
//
//  Created by Tran Cong Hoang on 4/4/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>



@interface LineEdgeView : UIView {
	CGPoint startPoint;
	CGPoint goalPoint;
}
@property CGPoint startPoint;
@property CGPoint goalPoint;
- (id)initWithPoint1:(CGPoint)point1 andPoint2:(CGPoint) point2;
-(void) adjustFrameToPoint1:(CGPoint)point1 andPoint2:(CGPoint) point2;
@end
