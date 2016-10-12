//
//  CABaseAnimationViewController.m
//  CoreAnimationDemo
//
//  Created by Mao on 26/09/2016.
//  Copyright © 2016 mao. All rights reserved.
//

#import "CABaseAnimationViewController.h"
#import <QuartzCore/QuartzCore.h>

@interface CABaseAnimationViewController ()<CAAnimationDelegate>
@property (nonatomic, strong) CALayer* testLayer;
@end

@implementation CABaseAnimationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
	
	
	self.title = @"CABaseAnimation";
	
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
	//rotation
	
	//创建 BaseAnimation
//	CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
	
	
	//启始值
//	[animation setFromValue:@1];
	
	//结束值
//	[animation setToValue:@4];
	
//	//倍数值
//	[animation setByValue:@5];
//	
//	//持续时间
//	[animation setDuration:2.0];
//	
//	//代理
//	[animation setDelegate:self];
	
	//模式
//	animation.fillMode = kCAFillModeForwards;
//	animation.removedOnCompletion = NO;

	//添加动画-执行动画
//	[self.testLayer addAnimation:animation forKey:nil];
	
	
	
	
	//创建 BaseAnimation
//	CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"bounds"];
//	
//	[animation setToValue:[NSValue valueWithCGRect:CGRectMake(0, 0, 400, 400)]];
//	[self.testLayer addAnimation:animation forKey:nil];
	
	CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform"];
	CATransform3D transform = CATransform3DMakeScale(0.5, 0.5, 1.0); //x, y, z
	[animation setToValue:[NSValue valueWithCATransform3D:transform]];
	[self.testLayer addAnimation:animation forKey:nil];
}


- (void)animationDidStart:(CAAnimation *)anim {
	printf("%s\n", __FUNCTION__);
}

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag {
	printf("%s\n", __FUNCTION__);
}


@end
