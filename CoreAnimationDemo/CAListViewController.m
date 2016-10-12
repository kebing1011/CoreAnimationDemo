//
//  DEMListViewController.m
//  CoreAnimationDemo
//
//  Created by Mao on 9/26/16.
//  Copyright © 2016 mao. All rights reserved.
//

#import "CAListViewController.h"
#import "CABaseAnimationViewController.h"
#import "CALayerHidenAnimationViewController.h"
#import "CAKeyframeAnimationControllerViewController.h"
#import "CATransitionViewController.h"
#import "CAAnimationGroupController.h"

@interface CAListViewController () <UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) UITableView* table;
@end

@implementation CAListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
	
	self.title  = @"CoreAnimationDemo";
	
	self.view.backgroundColor = [UIColor whiteColor];
	
	self.table = [[UITableView alloc] initWithFrame:self.view.bounds];
	[self.table registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
	
	self.table.delegate = self;
	self.table.dataSource = self;
	
	[self.view addSubview:self.table];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
	
	switch (indexPath.row) {
		case 0:
			cell.textLabel.text = @"CALayer隐式动画";
			break;
		case 1:
			cell.textLabel.text = @"BaseAnimation";
			break;
		case 2:
			cell.textLabel.text = @"KeyframeAnimation";
			break;
		case 3:
			cell.textLabel.text = @"TranstionAniamtion";
			break;
		case 4:
			cell.textLabel.text = @"CAAnimationGroup";
			break;
			
		default:
			break;
	}
	
	return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	[tableView deselectRowAtIndexPath:indexPath animated:YES];
	
	UIViewController* controller = nil;
	switch (indexPath.row) {
		case 0:
			controller = [[CALayerHidenAnimationViewController alloc] init];
			break;
		case 1:
		{
			controller = [[CABaseAnimationViewController alloc] init];
		}
			break;
		case 2:
			controller = [[CAKeyframeAnimationControllerViewController alloc] init];
			break;
		case 3:
			controller = [[CATransitionViewController alloc] init];
			break;
		case 4:
			controller = [[CAAnimationGroupController alloc] init];
			break;
		default:
			break;
			
			
	}
	
	[self.navigationController pushViewController:controller animated:YES];
}


@end
