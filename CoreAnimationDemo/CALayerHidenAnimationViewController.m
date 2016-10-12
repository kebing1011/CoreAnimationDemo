//
//  CALayerHidenAnimationViewController.m
//  CoreAnimationDemo
//
//  Created by Mao on 12/10/2016.
//  Copyright © 2016 mao. All rights reserved.
//

#import "CALayerHidenAnimationViewController.h"

@interface CALayerHidenAnimationViewController()
@property (nonatomic, strong) CALayer* testLayer;
@end

@implementation CALayerHidenAnimationViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	
	
	self.title = @"隐式动画";
	
	self.view.backgroundColor = [UIColor whiteColor];
	
	
	self.testLayer = [CALayer layer];
	self.testLayer.backgroundColor = [UIColor greenColor].CGColor;
	self.testLayer.bounds = CGRectMake(0, 0, 100, 100);
	self.testLayer.position  = self.view.center;
	self.testLayer.masksToBounds = YES;
	
	[self.view.layer addSublayer:self.testLayer];
}


- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
	//改变其属性就能引发隐式动画
/*
	//背景色 backgroundColor
	UIColor* color = [UIColor colorWithRed:arc4random() % 255 / 255.0f green:arc4random() % 255 / 255.0f blue:arc4random() % 255 / 255.0f alpha:1];
	self.testLayer.backgroundColor = color.CGColor;
 */
	
	/*
	//大小bounds
	int size = arc4random() % 200 + 10;
	self.testLayer.bounds = CGRectMake(0, 0, size, size);
	 */
/*
	//位置position 相当于 view 的 center
	CGPoint p = [[touches anyObject] locationInView:self.view];
	self.testLayer.position = p;
 */
//	self.testLayer.affineTransform = CGAffineTransformMakeRotation(M_PI_2);
	
//	self.testLayer.zPosition = 1;
}


@end
