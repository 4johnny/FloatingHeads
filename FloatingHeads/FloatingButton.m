//
//  FloatingButton.m
//  FloatingHeads
//
//  Created by Johnny on 2015-02-18.
//  Copyright (c) 2015 Empath Solutions. All rights reserved.
//

#import "FloatingButton.h"
#import "UIColor+UIColorFlat.h"


@implementation FloatingButton


- (instancetype)initWithFrame:(CGRect)frame andUIImage:(UIImage*)image andBackgroundColor:(UIColor*)backgroundColor {
	
	self = [super initWithFrame:frame];
	if (self) {

		[self setImage:image forState:UIControlStateNormal];
		self.backgroundColor = backgroundColor;
	}
	
	[self setup];
	
	return self;
}


- (instancetype)init {

	return [self initWithFrame:CGRectZero andUIImage:nil andBackgroundColor:nil];
}


- (void)awakeFromNib {
	[super awakeFromNib];
	
	self.backgroundColor = [UIColor flatBlueColor]; // NOTE: We choose default to be blue
	[self setup];
}


- (void)setup {
	
	self.tintColor = [UIColor whiteColor];
	self.layer.cornerRadius = self.bounds.size.width / 2;
	self.layer.masksToBounds = YES;
	[self setBackgroundImage:[self.backgroundColor pixelImageWithAlpha:0.7] forState:UIControlStateHighlighted];
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
