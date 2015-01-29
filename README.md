APLStoryboardContainerViewController
=========
A view controller which can load and embed other view controller from different storyboards.

* In a storyboard insert an ordinary view controller. Set at least the property 'storyboardName' for this view controller. The storyboard name specifies the storyboard from which to load another view controller which will then automatically loaded and embedded as child view controller. If the property 'viewControllerName' is not set the initial view controller of the storyboard will be loaded.

## Installation
Install via cocoapods by adding this to your Podfile:

	pod "APLStoryboardContainerViewController", "~> 0.0.1"

## Usage
Import header file:

	#import "APLStoryboardContainerViewController.h"
	