//
//  UIColor+UIColorFlat.h
//  FloatingHeads
//
//  Created by Johnny on 2015-02-18.
//  Copyright (c) 2015 Empath Solutions. All rights reserved.
//

#import <UIKit/UIKit.h>

#
# pragma mark - Interface
#

@interface UIColor (UIColorFlat)

#
# pragma mark Class Values
#

+ (UIColor*)flatWhiteColor;
+ (UIColor*)flatBlackColor;
+ (UIColor*)flatBlueColor;
+ (UIColor*)flatRedColor;

#
# pragma mark Methods
#

- (UIImage*)pixelImageWithAlpha:(CGFloat)alpha;
- (UIImage*)pixelImage;

@end
