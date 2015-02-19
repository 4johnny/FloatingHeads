//
//  FloatingMenuViewController.h
//  FloatingHeads
//
//  Created by Johnny on 2015-02-18.
//  Copyright (c) 2015 Empath Solutions. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FloatingButton.h"


#
# pragma mark - Enums
#

typedef NS_ENUM(NSInteger, Direction) {
	
	Direction_None = 0,
	
	Direction_Up,
	Direction_Left,
	Direction_Down,
	Driection_Right
};


#
# pragma mark - Protocols
#


@protocol FloatingMenuViewControllerDelegate <NSObject>

- (void)closePressed;
- (void)buttonPressed:(UIButton*)button;

@end


#
# pragma mark - Interface
#


@interface FloatingMenuViewController : UIViewController

#
# pragma mark Properties
#

@property (nonatomic) id <FloatingMenuViewControllerDelegate> delegate;

@property (nonatomic) UIView* fromView;
@property (nonatomic) UIVisualEffectView* blurredView;

@property (nonatomic) FloatingButton *closeButton;

@property (nonatomic) Direction defaultButtonDirection;
@property (nonatomic) CGFloat buttonPadding;
@property (nonatomic) NSMutableArray* buttonItems; // FloatingButton

#
# pragma mark Initializers
#

- (instancetype)initWithView:(UIView*)view;
- (instancetype)init;

@end
