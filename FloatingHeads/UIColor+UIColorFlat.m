//
//  UIColor+UIColorFlat.m
//  FloatingHeads
//
//  Created by Johnny on 2015-02-18.
//  Copyright (c) 2015 Empath Solutions. All rights reserved.
//

#import "UIColor+UIColorFlat.h"


#
# pragma mark - Implementation
#


@implementation UIColor (UIColorFlat)


#
# pragma mark Class Values
#


+ (UIColor*)flatWhiteColor {
	
	return [UIColor colorWithRed:0.9274 green:0.9436 blue:0.95 alpha:1.0];
}


+ (UIColor*)flatBlackColor {
	
	return [UIColor colorWithRed:0.1674 green:0.1674 blue:0.1674 alpha:1.0];
}


+ (UIColor*)flatBlueColor {
	
	return [UIColor colorWithRed:0.3132 green:0.3974 blue:0.6365 alpha:1.0];
	
}


+ (UIColor*)flatRedColor {

	return [UIColor colorWithRed:0.9115 green:0.2994 blue:0.2335 alpha:1.0];
}


#
# pragma mark Methods
#


- (UIImage*)pixelImageWithAlpha:(CGFloat)alpha {

	UIGraphicsBeginImageContext(CGSizeMake(1, 1));
	
	// Fill with black
	[[UIColor blackColor] setFill];
	UIRectFill(CGRectMake(0, 0, 1, 1));
	
	// Overlay tinted self color
	UIColor* tintedSelf = [self colorWithAlphaComponent:alpha];
	[tintedSelf setFill];
	UIRectFillUsingBlendMode(CGRectMake(0, 0, 1, 1), kCGBlendModeNormal);
	
	UIImage* image = UIGraphicsGetImageFromCurrentImageContext();
	
	UIGraphicsEndImageContext();
	
	return image;
}


- (UIImage*)pixelImage {

	return [self pixelImageWithAlpha:1.0];
}


@end
