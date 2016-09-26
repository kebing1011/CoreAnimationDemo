//
//  DEMListViewController.m
//  CoreAnimationDemo
//
//  Created by Mao on 9/26/16.
//  Copyright © 2016 mao. All rights reserved.
//

#import "CAListViewController.h"
#import "CABaseAnimationViewController.h"

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
	return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
	cell.textLabel.text = @"BaseAnimation";
	return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	[tableView deselectRowAtIndexPath:indexPath animated:YES];
	
	CABaseAnimationViewController* controller = [[CABaseAnimationViewController alloc] init];
	[self.navigationController pushViewController:controller animated:YES];
}


@end
