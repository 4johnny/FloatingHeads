//
//  UIColor+UIColorFlat.h
//  FloatingHeads
//
//  Created by Johnny on 2015-02-18.
//  Copyright (c) 2015 Empath Solutions. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (UIColorFlat)

+ (UIColor*)flatWhiteColor;
+ (UIColor*)flatBlackColor;
+ (UIColor*)flatBlueColor;
+ (UIColor*)flatRedColor;

- (UIImage*)pixelImageWithAlpha:(CGFloat)alpha;
- (UIImage*)pixelImage;

@end