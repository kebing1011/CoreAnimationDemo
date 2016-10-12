//
//  CAAnimationGroupController.m
//  CoreAnimationDemo
//
//  Created by Mao on 12/10/2016.
//  Copyright © 2016 mao. All rights reserved.
//

#import "CAAnimationGroupController.h"

#import <QuartzCore/QuartzCore.h>

@interface CAAnimationGroupController ()<CAAnimationDelegate>
@property (nonatomic, strong) CALayer* testLayer;
@end

@implementation CAAnimationGroupController

- (void)viewDidLoad {
	[super viewDidLoad];
	
	
	self.title = @"CAAnimationGroup";
	
	self.view.backgroundColor = [UIColor whiteColor];
	
	
	self.testLayer = [CALayer layer];
	self.testLayer.backgroundColor = [UIColor redColor].CGColor;
	self.testLayer.bounds = CGRectMake(0, 0, 60, 60);
	self.testLayer.position  = self.view.center;
	self.testLayer.masksToBounds = YES;
	//	self.testLayer.cornerRadius = 30;
	
	[self.view.layer addSublayer:self.testLayer];
}



- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
	CABasicAnimation *animation1 = [CABasicAnimation animationWithKeyPath:@"position"];
	animation1.fromValue = [NSValue valueWithCGPoint:CGPointMake(100, 100)];
	animation1.toValue = [NSValue valueWithCGPoint:CGPointMake(300, 300)];

	CABasicAnimation *animation2 = [CABasicAnimation animationWithKeyPath:@"transform.scale.x"];
	animation2.byValue = @3;

	
	CAAnimationGroup* group = [CAAnimationGroup animation];
	group.animations = @[animation1, animation2];
	group.duration = 3;
	group.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
	group.autoreverses = YES;

	
	[self.testLayer addAnimation:group forKey:nil];
}


- (void)animationDidStart:(CAAnimation *)anim {
	printf("%s\n", __FUNCTION__);
}

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag {
	printf("%s\n", __FUNCTION__);
}


@end

