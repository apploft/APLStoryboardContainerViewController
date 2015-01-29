//
//  APLStoryboardContainerViewController.h
//
//  Created by Tino Rachui on 29.01.2015.
//  Copyright (c) 2015 apploft GmbH. All rights reserved.
//
#import "APLStoryboardContainerViewController.h"

@interface APLStoryboardContainerViewController ()
@property (strong, nonatomic) UIViewController *childViewController;
@property (nonatomic, strong) UINavigationController *navigationController;
@end

@implementation APLStoryboardContainerViewController
@synthesize childViewController = _childViewController;

- (void) viewDidLoad {
    [super viewDidLoad];
    
    [self addChildViewController];
}

- (UINavigationItem *)navigationItem {
    UINavigationItem *navItem = self.childViewController.navigationItem;
    
    if(navItem == nil) {
        navItem = [super navigationItem];
    }
    return navItem;
}

-(void)loadChildViewControllerFromStoryboard {
    UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:self.storyboardName bundle:nil];
    
    if ([self.viewControllerName length] > 0) {
        self.childViewController = [storyBoard instantiateViewControllerWithIdentifier:self.viewControllerName];
    } else {
        self.childViewController = [storyBoard instantiateInitialViewController];
    }
}

-(UIViewController*)childViewController {
    if (_childViewController == nil) {
        [self loadChildViewControllerFromStoryboard];
    }
    return _childViewController;
}

-(void)prepareViewControllerForAppearance:(UIViewController*)viewController {
    
}

-(void)addChildViewController {
    [self prepareViewControllerForAppearance:self.childViewController];
    
    UIViewController *childViewController = self.childViewController;
    
    if ([self.embedChildViewControllerInNavigationController boolValue]) {
        self.navigationController = [[UINavigationController alloc] initWithRootViewController:self.childViewController];
        DBG_VIEW_FRAMEC(self.navigationController.view, magentaColor);
        childViewController = self.navigationController;
    }

    UIView *childView = childViewController.view;
    
    childView.translatesAutoresizingMaskIntoConstraints = NO;
    
    [self.view addSubview:childView];
    
    NSDictionary *viewDict = NSDictionaryOfVariableBindings(childView);
    NSArray *constraints = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[childView]-0-|" options:0 metrics:nil views:viewDict];
    [self.view addConstraints:constraints];
    constraints = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[childView]-0-|" options:0 metrics:nil views:viewDict];
    [self.view addConstraints:constraints];
    
    [self addChildViewController:childViewController];
    [childViewController didMoveToParentViewController:self];
}

-(void)removeChildViewController:(UIViewController*)childViewController {
    [childViewController willMoveToParentViewController:nil];
    [childViewController.view removeFromSuperview];
    [childViewController removeFromParentViewController];
}

- (void)setChildViewController:(UIViewController *)childViewController {
    UIViewController *oldChild = _childViewController;
    
    if ([self.embedChildViewControllerInNavigationController boolValue]) {
        oldChild = self.navigationController;
    }

    _childViewController = childViewController;
    
    if (oldChild) {
        [self removeChildViewController:oldChild];
    }
}

#pragma mark - Rotation handling

-(NSUInteger)supportedInterfaceOrientations {
    return [self.childViewController supportedInterfaceOrientations];
}

-(BOOL)shouldAutorotate {
    return [self.childViewController shouldAutorotate];
}

@end
