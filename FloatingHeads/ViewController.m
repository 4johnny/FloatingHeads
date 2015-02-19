//
//  ViewController.m
//  FloatingHeads
//
//  Created by Johnny on 2015-02-18.
//  Copyright (c) 2015 Empath Solutions. All rights reserved.
//

#import "ViewController.h"
#import "FloatingMenuViewController.h"
#import "UIColor+UIColorFlat.h"


#
# pragma mark - Interface
#


@interface ViewController ()

@end


#
# pragma mark - Implementation
#


@implementation ViewController


#
# pragma mark UIViewController
#


- (void)viewDidLoad {
	[super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}


#
# pragma mark <FloatingMenuViewControllerDelegate>
#


- (void)closePressed {

	NSLog(@"Floating close button pressed");
	[self dismissViewControllerAnimated:YES completion:nil];
}


- (void)buttonPressed:(UIButton*)button {
	
	NSLog(@"Floating button pressed: %@", button);
	[self dismissViewControllerAnimated:YES completion:nil];
}


#
# pragma mark Action Handlers
#


- (IBAction)addPressed:(FloatingButton *)sender {

	FloatingMenuViewController* floatingMenuViewController = [[FloatingMenuViewController alloc] initWithView:self.addButton];
	floatingMenuViewController.delegate = self;
	floatingMenuViewController.buttonItems = [self getFloatingButtons];
	floatingMenuViewController.buttonPadding = 20;
	
	[self presentViewController:floatingMenuViewController animated:YES completion:nil];
}


#
# pragma mark Helpers
#


- (NSMutableArray*)getFloatingButtons {

	CGFloat diameter = self.addButton.bounds.size.width;
	
	NSMutableArray* floatingButtons = [NSMutableArray array];
	
	[floatingButtons addObject:[[FloatingButton alloc] initWithFrame:CGRectMake(0, 0, diameter, diameter) andUIImage:[UIImage imageNamed:@"icon-add"] andBackgroundColor:[UIColor flatBlueColor]]];
	
	[floatingButtons addObject:[[FloatingButton alloc] initWithFrame:CGRectMake(0, 0, diameter, diameter) andUIImage:[UIImage imageNamed:@"model-008"] andBackgroundColor:[UIColor flatWhiteColor]]];
	
	[floatingButtons addObject:[[FloatingButton alloc] initWithFrame:CGRectMake(0, 0, diameter, diameter) andUIImage:[UIImage imageNamed:@"model-007"] andBackgroundColor:[UIColor flatWhiteColor]]];
	
	[floatingButtons addObject:[[FloatingButton alloc] initWithFrame:CGRectMake(0, 0, diameter, diameter) andUIImage:[UIImage imageNamed:@"model-004"] andBackgroundColor:[UIColor flatWhiteColor]]];
	
	[floatingButtons addObject:[[FloatingButton alloc] initWithFrame:CGRectMake(0, 0, diameter, diameter) andUIImage:[UIImage imageNamed:@"model-005"] andBackgroundColor:[UIColor flatWhiteColor]]];\
	
	return floatingButtons;
}


@end
