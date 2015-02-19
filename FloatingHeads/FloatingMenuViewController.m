//
//  FloatingMenuViewController.m
//  FloatingHeads
//
//  Created by Johnny on 2015-02-18.
//  Copyright (c) 2015 Empath Solutions. All rights reserved.
//

#import "FloatingMenuViewController.h"
#import "UIColor+UIColorFlat.h"


#
# pragma mark - Interface
#


@interface FloatingMenuViewController ()

@end


#
# pragma mark - Implementation
#


@implementation FloatingMenuViewController


#
# pragma mark Initializers
#


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


#
# pragma mark UIViewController
#


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


- (void)viewWillAppear:(BOOL)animated {

	[self configureButtons];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


/*
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


- (IBAction)closePressed:(FloatingButton *)sender {

	[self.delegate closePressed];
}


- (IBAction)buttonPressed:(FloatingButton *)sender {
	
	[self.delegate buttonPressed:sender];
}


#
# pragma mark Helpers
#


- (void)configureButtons {

	CGPoint center = self.fromView.center;
	
	// Center close button
	self.closeButton.center = center;
	
	// Load floating buttons above close button
	CGFloat centerX = center.x;
	CGFloat centerY = center.y - self.closeButton.bounds.size.height - self.buttonPadding;
	for (UIButton* button in self.buttonItems) {
		
		[button addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];
		button.center = CGPointMake(centerX, centerY);
		[self.view addSubview:button];
		
		centerY = button.center.y - button.bounds.size.height - self.buttonPadding;
	}
}


@end
