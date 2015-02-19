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
# pragma mark - Constants
#


# define BUTTON_ANIMATE_TIME		0.25 // seconds
# define BUTTON_ANIMATE_ALPHA		0.7
# define BUTTON_ANIMATE_ROTATION	-M_PI_2 // radians


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
	self.closeButton = [[FloatingButton alloc] initWithFrame:CGRectMake(0, 0, self.fromView.bounds.size.width, self.fromView.bounds.size.height) andUIImage:[UIImage imageNamed:@"icon-close"] andBackgroundColor:[UIColor flatRedColor]];
	[self.closeButton addTarget:self action:@selector(closePressed:) forControlEvents:UIControlEventTouchUpInside];
	[self.view addSubview:self.closeButton];
}


- (void)viewWillAppear:(BOOL)animated {

	[self configureButtons];
}


- (void)viewWillDisappear:(BOOL)animated {
	
	[self animateButtonsToClose];
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
	self.closeButton.transform = CGAffineTransformMakeRotation(BUTTON_ANIMATE_ROTATION);
	
	[UIView animateWithDuration:BUTTON_ANIMATE_TIME animations:^{
	
		self.closeButton.transform = CGAffineTransformIdentity;
	}];

	// Load floating buttons above close button
	[self.buttonItems  enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
		UIButton* button = (UIButton*)obj;
		
		[button addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];
		button.center = center;
		button.alpha = BUTTON_ANIMATE_ALPHA;
		button.transform = CGAffineTransformMakeRotation(BUTTON_ANIMATE_ROTATION);
		[self.view insertSubview:button belowSubview:self.closeButton];
		if (idx == 0) {
			button.alpha = 1.0;
			[self.view bringSubviewToFront:button];
		}
		
		// Animate to open positions
		[UIView animateWithDuration:BUTTON_ANIMATE_TIME animations:^{
			
			CGFloat centerY = button.center.y - (idx + 1) * (self.closeButton.bounds.size.height + self.buttonPadding);
			button.center = CGPointMake(button.center.x, centerY);
			
			button.alpha = 1.0;
			button.transform = CGAffineTransformIdentity;
		}];
	}];
}


- (void)animateButtonsToClose {
	
	[UIView animateWithDuration:BUTTON_ANIMATE_TIME animations:^{
		
		self.closeButton.transform = CGAffineTransformMakeRotation(-BUTTON_ANIMATE_ROTATION);

		[self.buttonItems enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
			UIButton* button = (UIButton*)obj;
			
			button.center = self.closeButton.center;
			button.alpha = idx == 0 ? 1.0 : BUTTON_ANIMATE_ALPHA;
			button.transform = CGAffineTransformMakeRotation(-BUTTON_ANIMATE_ROTATION);
		}];
	}];
}


@end
