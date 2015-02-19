//
//  ViewController.h
//  FloatingHeads
//
//  Created by Johnny on 2015-02-18.
//  Copyright (c) 2015 Empath Solutions. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FloatingButton.h"
#import "FloatingMenuViewController.h"


#
# pragma mark - Interface
#

@interface ViewController : UIViewController <FloatingMenuViewControllerDelegate>

#
# pragma mark Properties
#

@property (weak, nonatomic) IBOutlet FloatingButton *addButton;

@end

