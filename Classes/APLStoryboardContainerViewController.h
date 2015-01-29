//
//  APLStoryboardContainerViewController.h
//
//  Created by Tino Rachui on 29.01.2015.
//  Copyright (c) 2015 apploft GmbH. All rights reserved.
//

#import <UIKit/UIKit.h>
/**
 *  @class APLStoryboardContainerViewController
 *
 *  A container view controller which allows to reference other storyboards in a storyboard.
 *  @discussion
 *  Add an instance of this view controller to a storyboard and set the name of
 *  the other storyboard as storyboardName in the user defined runtime attributes.
 *
 *  The inital view controller of the referenced storyboard will be automatically
 *  added as child view controller.
 */
@interface APLStoryboardContainerViewController : UIViewController

/**
 *  The name of the storyboard to load.
 *  It's initial view controller will be embedded as child view controller.
 *  The navigation item of the child view controller will be used as navigation item.
 */
@property (copy, nonatomic) NSString *storyboardName;

/**
 *  The name of the view controller to load from the storyboard named 'storyboardName'. 
 *  If 'viewControllerName' is empty the initial view controller from storyboard will 
 *  be loaded.
 */
@property (copy, nonatomic) NSString *viewControllerName;

/**
 *  Child view controller, which will be set to the inital view controller of the referenced storyboard.
 */
@property (strong, nonatomic, readonly) UIViewController *childViewController;

/**
 *  Set to 'YES' if the container controller should embed the child view controller in a navigation controller.
 *  If set tp 'NO' (default) the child view controller will be embeded as child view controller as is.
 */
@property (nonatomic, strong) NSNumber *embedChildViewControllerInNavigationController;

/**
 *  Will be called right before (before its view will actually be loaded) the child view controller will be 
 *  added as child view controller. Subclasses may override this method and prepare the child view controller 
 *  in whatever way they like. The base class implementation does nothing.
 *
 *  @param viewController the child view controller to be displayed
 */
-(void)prepareViewControllerForAppearance:(UIViewController*)viewController;

@end
