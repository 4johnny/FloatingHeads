//
//  FloatingMenuViewController.h
//  FloatingHeads
//
//  Created by Johnny on 2015-02-18.
//  Copyright (c) 2015 Empath Solutions. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FloatingButton.h"


@interface FloatingMenuViewController : UIViewController

@property (nonatomic) UIView* fromView;
@property (nonatomic) UIVisualEffectView* blurredView;

@property (nonatomic) FloatingButton *closeButton;

- (instancetype)initWithView:(UIView*)view;
- (instancetype)init;

@end
