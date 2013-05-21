## IGAutoCompletionToolbar

IGAutoCompletionToolbar is a UICollectionView subclass created to display auto completion via a keyboard accessory view.

![screenshot](screenshot.png)

### Try It Out!
<!-- MacBuildServer Install Button -->
<div class="macbuildserver-block">
    <a class="macbuildserver-button" href="http://macbuildserver.com/project/github/build/?xcode_project=IGAutoCompletionToolbar.xcodeproj&amp;target=IGAutoCompletionToolbar&amp;repo_url=git%3A%2F%2Fgithub.com%2Fsiuying%2FIGAutoCompletionToolbar.git&amp;build_conf=Debug" target="_blank"><img src="http://com.macbuildserver.github.s3-website-us-east-1.amazonaws.com/button_up.png"/></a><br/><sup><a href="http://macbuildserver.com/github/opensource/" target="_blank">by MacBuildServer</a></sup>
</div>
<!-- MacBuildServer Install Button -->

### Requirements

iOS 6 or above with ARC.

### Installation

If you are using CocoaPods, add 'IGAutoCompletionToolbar' to your Podfile:

```
pod 'IGAutoCompletionToolbar', '~> 0.1.6'
```

Otherwise, download the projects and add files under IGAutoCompletionToolbar/* and 'QuartzCore' framework to your project.

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