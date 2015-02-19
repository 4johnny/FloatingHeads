//
//  FloatingMenuViewController.h
//  FloatingHeads
//
//  Created by Johnny on 2015-02-18.
//  Copyright (c) 2015 Empath Solutions. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FloatingButton.h"


@protocol FloatingMenuViewControllerDelegate <NSObject>

- (CGPoint)getCancelButtonCenter;
- (void)cancelPressed;

@end


@interface FloatingMenuViewController : UIViewController

@property (nonatomic) id <FloatingMenuViewControllerDelegate> delegate;

@property (nonatomic) UIView* fromView;
@property (nonatomic) UIVisualEffectView* blurredView;

@property (nonatomic) FloatingButton *closeButton;

- (instancetype)initWithView:(UIView*)view;
- (instancetype)init;

@end
