APLRKNetworkLayer
=========
Base- and helper classes for App communicating with Restful APIs via RestKit.

* A network layer base class which helps to quickly setup RestKit to connect to a Restful API
* Helper methods for Facebook-Login
* Network aware base view controller whith built-in handling for data loading, showing overlays while loading data or when no data have been loaded yet by a view controller, 
  automatic handling when loading data failed etc.

## Installation
Install via cocoapods by adding this to your Podfile:

	pod "APLRKNetworkLayer", "~> 0.0.1"

## Usage
Import header file:

	#import "APLRKNetwork.h"
	
Derive classes from APLRKNetworkLayer, APLRKApiConnector, APLRKBaseViewController to setup your specific network layer.