//
//  FloatingMenuViewController.m
//  FloatingHeads
//
//  Created by Johnny on 2015-02-18.
//  Copyright (c) 2015 Empath Solutions. All rights reserved.
//

#import "FloatingMenuViewController.h"
#import "UIColor+UIColorFlat.h"


@interface FloatingMenuViewController ()

@end


@implementation FloatingMenuViewController


- (instancetype)initWithView:(UIView*)view {
	
	self = [super initWithNibName:nil bundle:nil];
	if (self) {
		
		self.fromView = view;
		
		self.modalPresentationStyle = UIModalPresentationOverFullScreen;
		self.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
	}
	
	return self;
}


- (instancetype)init {
	
	return [self initWithView:nil];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
	
	// Config blur view
	self.blurredView = [[UIVisualEffectView alloc] initWithEffect:[UIBlurEffect effectWithStyle:UIBlurEffectStyleLight]];
	self.blurredView.frame = self.view.frame;
	[self.view addSubview:self.blurredView];
	
	// Config close button
	self.closeButton = [[FloatingButton alloc] initWithFrame:CGRectMake(0, 0, 50, 50) andUIImage:[UIImage imageNamed:@"icon-close"] andBackgroundColor:[UIColor flatRedColor]];
	[self.closeButton addTarget:self action:@selector(closePressed:) forControlEvents:UIControlEventTouchUpInside];
	[self.view addSubview:self.closeButton];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


- (IBAction)closePressed:(FloatingButton *)sender {
	
	
}


@end
