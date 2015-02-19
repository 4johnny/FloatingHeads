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


- (void)awakeFromNib {
	[super awakeFromNib];
	
	[self setup];
}


- (void)setup {
	
	self.tintColor = [UIColor whiteColor];
	self.backgroundColor = [UIColor flatBlueColor];
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
