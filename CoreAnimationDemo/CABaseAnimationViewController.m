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
@property (nonatomic, strong) CALayer* ballLayer;
@end

@implementation CABaseAnimationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
	
	
	self.title = @"CABaseAnimation";
	
	self.view.backgroundColor = [UIColor whiteColor];
	
	
	self.ballLayer = [CALayer layer];
	self.ballLayer.backgroundColor = [UIColor redColor].CGColor;
	self.ballLayer.bounds = CGRectMake(0, 0, 60, 60);
	self.ballLayer.position  = self.view.center;
	self.ballLayer.masksToBounds = YES;
//	self.ballLayer.cornerRadius = 30;
	
	[self.view.layer addSublayer:self.ballLayer];
}




- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
	UITouch* touch = [touches anyObject];
	
	CGPoint point = [touch locationInView:self.view];
	
	
	printf("%f, %f\n", point.x, point.y);
	
	
	[self animationAtPoint:point];
	
}


- (void)animationAtPoint:(CGPoint )point
{
	CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
//	[animation setFromValue:@1];
//	[animation setToValue:@4];
	[animation setByValue:@5];
	[animation setDuration:2.0];
	[animation setDelegate:self];
	animation.fillMode = kCAFillModeForwards;
	animation.removedOnCompletion = NO;
//	[self.ballLayer setPosition:point];
	[self.ballLayer addAnimation:animation forKey:nil];
}


/* Called when the animation begins its active duration. */

- (void)animationDidStart:(CAAnimation *)anim {
	printf("%s\n", __FUNCTION__);
}

/* Called when the animation either completes its active duration or
 * is removed from the object it is attached to (i.e. the layer). 'flag'
 * is true if the animation reached the end of its active duration
 * without being removed. */

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag {
	printf("%s\n", __FUNCTION__);
}


@end
