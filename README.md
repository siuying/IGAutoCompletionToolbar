## IGAutoCompletionToolbar

IGAutoCompletionToolbar is a UICollectionView subclass created to display auto completion via a keyboard accessory view.

![screenshot](screenshot.png)

### Requirements

iOS 5 or above with ARC.

### Installation

If you are using CocoaPods, add 'IGAutoCompletionToolbar' to your Podfile:

```
pod 'IGAutoCompletionToolbar', '0.1.2'
```

Otherwise, download the projects and add files under IGAutoCompletionToolbar/* and 'QuartzCore' framework to your project.

### Installation for iOS 5

IGAutoCompletionToolbar depends on UICollectionView which is introduced in iOS 6. If you are building for 
iOS 5.x, you can include the iOS 5 compatible version, which is based on [PSTCollectionView](https://github.com/steipete/PSTCollectionView).

```
pod 'IGAutoCompletionToolbar/ios', '0.1.2'
```

### Usage

Import IGAutoCompletionToolbar from your application:

```
#import "IGAutoCompletionToolbar.h"
```

Then create the toolbar and connect it with the textfield:

```
// Create the toolbar
IGAutoCompletionToolbar* toolbar = [[IGAutoCompletionToolbar alloc] initWithFrame:CGRectMake(0,0,320,44)];

// set auto complete items
toolbar.items = @[@"Apple", @"Banana", @"Blueberry", @"Grape", @"Pineapple", @"Orange", @"Pear"];

// setup the delegate
toolbar.toolbarDelegate = self;

// setup the text field to be used
toolbar.textField = self.textfield;

// set the toolbar as the input accessory view of the textfield
self.textfield.inputAccessoryView = toolbar;
```

### Contact

Francis Chong [[Blog](http://reality.hk), [Twitter](http://twitter.com/siuying)]

### License

IGAutoCompletionToolbar is available under the MIT license. See the LICENSE file for more info.