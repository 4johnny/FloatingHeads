//
//  ViewController.m
//  FloatingHeads
//
//  Created by Johnny on 2015-02-18.
//  Copyright (c) 2015 Empath Solutions. All rights reserved.
//

#import "ViewController.h"
#import "FloatingMenuViewController.h"


@interface ViewController ()

@end


@implementation ViewController


- (void)viewDidLoad {
	[super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}


- (IBAction)addPressed:(FloatingButton *)sender {

	FloatingMenuViewController* floatingMenuViewController = [[FloatingMenuViewController alloc] initWithView:self.view];
	floatingMenuViewController.delegate = self;
	[self presentViewController:floatingMenuViewController animated:YES completion:nil];
}


- (CGPoint)getCancelButtonCenter {

	return self.addButton.center;
}


@end
