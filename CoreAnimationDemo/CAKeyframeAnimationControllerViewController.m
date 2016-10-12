//
//  CAKeyframeAnimationControllerViewController.m
//  CoreAnimationDemo
//
//  Created by Mao on 12/10/2016.
//  Copyright © 2016 mao. All rights reserved.
//

#import "CAKeyframeAnimationControllerViewController.h"

@interface CAKeyframeAnimationControllerViewController ()<CAAnimationDelegate>
@property (nonatomic, strong) CALayer* testLayer;
@end

@implementation CAKeyframeAnimationControllerViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	
	
	self.title = @"CABaseAnimation";
	
	self.view.backgroundColor = [UIColor whiteColor];
	
	
	self.testLayer = [CALayer layer];
	self.testLayer.backgroundColor = [UIColor redColor].CGColor;
	self.testLayer.bounds = CGRectMake(0, 0, 60, 60);
	self.testLayer.position  = self.view.center;
	self.testLayer.masksToBounds = YES;
//		self.testLayer.cornerRadius = 30;
	
	[self.view.layer addSublayer:self.testLayer];
}



- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
	/*
	//动画-放大
	CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"transform.scale"];
	animation.duration = 3;
	animation.values = @[@(0.1),@(1.0),@(1.2)]; //A-B-C
	animation.keyTimes = @[@(0.0),@(0.5),@(1.0)];
	animation.calculationMode = kCAAnimationLinear;
	
	CAMediaTimingFunction* f1 = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
	CAMediaTimingFunction* f2 = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
	CAMediaTimingFunction* f3 = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];

	animation.timingFunctions = @[f1, f2, f3];

	[self.testLayer addAnimation:animation forKey:nil];
	 */

	/*
	//eg. 位置
	CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
	animation.duration = 4;
	
	NSValue* v1 = [NSValue valueWithCGPoint:CGPointMake(100, 100)];
	NSValue* v2 = [NSValue valueWithCGPoint:CGPointMake(200, 100)];
	NSValue* v3 = [NSValue valueWithCGPoint:CGPointMake(100, 200)];
	NSValue* v4 = [NSValue valueWithCGPoint:CGPointMake(200, 200)];


	animation.values = @[v1, v2, v3, v4]; //A-B-C
//	animation.keyTimes = @[@(0.0),@(0.5),@(1.0)];
//	animation.calculationMode = kCAAnimationLinear;
//	
	CAMediaTimingFunction* f1 = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
	CAMediaTimingFunction* f2 = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
	CAMediaTimingFunction* f3 = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
	CAMediaTimingFunction* f4 = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];

	animation.timingFunctions = @[f1, f2, f3, f4];
	
	[self.testLayer addAnimation:animation forKey:nil];
	
	 */
	
	/*
	
	//eg.path
	CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
	animation.duration = 4;
	CGMutablePathRef path = CGPathCreateMutable();
	//将路径的起点定位到
	CGPathMoveToPoint(path,NULL,50.0,120.0);
	//下面5行添加5条直线的路径到path中
	CGPathAddLineToPoint(path,
						 NULL, 60, 130);
	CGPathAddLineToPoint(path,
						 NULL, 70, 140);
	CGPathAddLineToPoint(path,
						 NULL, 80, 150);
	CGPathAddLineToPoint(path,
						 NULL, 90, 160);
	CGPathAddLineToPoint(path,
						 NULL, 100, 170);
	
	//下面四行添加四条曲线路径到path
	CGPathAddCurveToPoint(path,NULL,50.0,275.0,150.0,275.0,70.0,120.0);
	CGPathAddCurveToPoint(path,NULL,150.0,275.0,250.0,275.0,90.0,120.0);
	CGPathAddCurveToPoint(path,NULL,250.0,275.0,350.0,275.0,110.0,120.0);
	CGPathAddCurveToPoint(path,NULL,350.0,275.0,450.0,275.0,130.0,120.0);
	
	animation.path = path;
	
	
	[self.testLayer addAnimation:animation forKey:nil];
	
	*/
	
	
//	CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"transform.rotation.x"];
	CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"transform.rotation.z"];

	animation.values = @[@(0), @(M_PI_4), @(M_PI_2), @(M_PI)];
	
	[self.testLayer addAnimation:animation forKey:nil];
}


@end
