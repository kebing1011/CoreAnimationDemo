//
//  CATransitionViewController.m
//  CoreAnimationDemo
//
//  Created by Mao on 12/10/2016.
//  Copyright © 2016 mao. All rights reserved.
//

#import "CATransitionViewController.h"

typedef enum : NSUInteger {
	Fade = 0,                   //淡入淡出
	Push,                       //推挤
	Reveal,                     //揭开
	MoveIn,                     //覆盖
	Cube,                       //立方体
	SuckEffect,                 //吮吸
	OglFlip,                    //翻转
	RippleEffect,               //波纹
	PageCurl,                   //翻页
	PageUnCurl,                 //反翻页
	CameraIrisHollowOpen,       //开镜头
	CameraIrisHollowClose,      //关镜头
	CurlDown,                   //下翻页
	CurlUp,                     //上翻页
	FlipFromLeft,               //左翻转
	FlipFromRight,              //右翻转
	
} AnimationType;





@interface CATransitionViewController () <UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) UITableView* table;

@property (nonatomic, assign) int subtype;
@property (nonatomic, strong) NSDictionary* animationInfo;
@property (nonatomic, strong) UIImageView* imageView;
@end




@implementation CATransitionViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	
	self.animationInfo =  @{
									 @(Fade)          :   @"淡入淡出",
									 @(Push)            :           @"推挤",
									 @(Reveal)           :          @"揭开",
									 @(MoveIn)            :         @"覆盖",
									 @(Cube)               :        @"立方体",
									 @(SuckEffect)          :       @"吮吸",
									 @(OglFlip)              :      @"翻转",
									 @(RippleEffect)        :       @"波纹",
									 @(PageCurl)            :       @"翻页",
									 @(PageUnCurl)          :       @"反翻页",
									 @(CameraIrisHollowOpen) :      @"开镜头",
									 @(CameraIrisHollowClose) :     @"关镜头",
									 @(CurlDown)              :     @"下翻页",
									 @(CurlUp)                :    @"上翻页",
									 @(FlipFromLeft)          :     @"左翻转",
									 @(FlipFromRight)          :    @"右翻转"
									 };
	

	self.title  = @"CATransition动画";
	
	self.view.backgroundColor = [UIColor whiteColor];
	
	self.table = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, self.view.bounds.size.width, self.view.bounds.size.height - 64)];
	
	[self.table registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
	
	self.table.delegate = self;
	self.table.dataSource = self;
	
	
	self.imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 64, self.view.bounds.size.width, self.view.bounds.size.height - 64)];
	self.imageView.image = [UIImage imageNamed:@"01.jpg"];


	[self.view addSubview:self.imageView];
	[self.view addSubview:self.table];
	self.table.backgroundView = nil;
	self.table.backgroundColor = [UIColor clearColor];
}




- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	return self.animationInfo.allKeys.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
	cell.textLabel.text = self.animationInfo[@(indexPath.row)];
	cell.backgroundColor = [UIColor clearColor];
	cell.textLabel.textColor = [UIColor whiteColor];
	
	return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	[tableView deselectRowAtIndexPath:indexPath animated:YES];
	
	[self taptag:indexPath.row];
}



- (void)taptag:(NSInteger)tag {
 
	AnimationType animationType = tag;
	
	NSString *subtypeString;
	
	switch (_subtype) {
		case 0:
			subtypeString = kCATransitionFromLeft;
			break;
		case 1:
			subtypeString = kCATransitionFromBottom;
			break;
		case 2:
			subtypeString = kCATransitionFromRight;
			break;
		case 3:
			subtypeString = kCATransitionFromTop;
			break;
		default:
			break;
	}
	_subtype += 1;
	if (_subtype > 3) {
		_subtype = 0;
	}
	
	
	switch (animationType) {
		case Fade:
			[self transitionWithType:kCATransitionFade WithSubtype:subtypeString ForView:self.view];
			break;
			
		case Push:
			[self transitionWithType:kCATransitionPush WithSubtype:subtypeString ForView:self.view];
			break;
			
		case Reveal:
			[self transitionWithType:kCATransitionReveal WithSubtype:subtypeString ForView:self.view];
			break;
			
		case MoveIn:
			[self transitionWithType:kCATransitionMoveIn WithSubtype:subtypeString ForView:self.view];
			break;
			
		case Cube:
			[self transitionWithType:@"cube" WithSubtype:subtypeString ForView:self.view];
			break;
			
		case SuckEffect:
			[self transitionWithType:@"suckEffect" WithSubtype:subtypeString ForView:self.view];
			break;
			
		case OglFlip:
			[self transitionWithType:@"oglFlip" WithSubtype:subtypeString ForView:self.view];
			break;
			
		case RippleEffect:
			[self transitionWithType:@"rippleEffect" WithSubtype:subtypeString ForView:self.view];
			break;
			
		case PageCurl:
			[self transitionWithType:@"pageCurl" WithSubtype:subtypeString ForView:self.view];
			break;
			
		case PageUnCurl:
			[self transitionWithType:@"pageUnCurl" WithSubtype:subtypeString ForView:self.view];
			break;
			
		case CameraIrisHollowOpen:
			[self transitionWithType:@"cameraIrisHollowOpen" WithSubtype:subtypeString ForView:self.view];
			break;
			
		case CameraIrisHollowClose:
			[self transitionWithType:@"cameraIrisHollowClose" WithSubtype:subtypeString ForView:self.view];
			break;
			
		case CurlDown:
			[self animationWithView:self.view WithAnimationTransition:UIViewAnimationTransitionCurlDown];
			break;
			
		case CurlUp:
			[self animationWithView:self.view WithAnimationTransition:UIViewAnimationTransitionCurlUp];
			break;
			
		case FlipFromLeft:
			[self animationWithView:self.view WithAnimationTransition:UIViewAnimationTransitionFlipFromLeft];
			break;
			
		case FlipFromRight:
			[self animationWithView:self.view WithAnimationTransition:UIViewAnimationTransitionFlipFromRight];
			break;
			
		default:
			break;
	}
	
	static int i = 0;
	if (i == 0) {
		self.imageView.image = [UIImage imageNamed:@"02.jpg"];
		i = 1;
	}
	else
	{
		self.imageView.image = [UIImage imageNamed:@"01.jpg"];
		i = 0;
	}
	
}



#pragma CATransition动画实现
- (void) transitionWithType:(NSString *) type WithSubtype:(NSString *) subtype ForView : (UIView *) view
{
	//创建CATransition对象
	CATransition *animation = [CATransition animation];
	
	//设置运动时间
	animation.duration = 0.5;
	
	//设置运动type
	animation.type = type;
	if (subtype != nil) {
		
		//设置子类
		animation.subtype = subtype;
	}
	
	//设置运动速度
	animation.timingFunction = UIViewAnimationOptionCurveEaseInOut;
	
	[view.layer addAnimation:animation forKey:@"animation"];
}



#pragma UIView实现动画
- (void) animationWithView : (UIView *)view WithAnimationTransition : (UIViewAnimationTransition) transition
{
	[UIView animateWithDuration:0.5 animations:^{
		[UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
		[UIView setAnimationTransition:transition forView:view cache:YES];
	}];
}



@end


