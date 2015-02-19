//
//  FloatingButton.h
//  FloatingHeads
//
//  Created by Johnny on 2015-02-18.
//  Copyright (c) 2015 Empath Solutions. All rights reserved.
//

#import <UIKit/UIKit.h>

#
# pragma mark - Interface
#

@interface FloatingButton : UIButton

#
# pragma mark Initializers
#

- (instancetype)initWithFrame:(CGRect)frame andUIImage:(UIImage*)image andBackgroundColor:(UIColor*)backgroundColor;
- (instancetype)init;

@end
