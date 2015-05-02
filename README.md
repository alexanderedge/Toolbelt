# Toolbelt
Toolbelt is a collection of class extensions for iOS and OS X development written in Swift. You can use Toolbelt in your Objective-C or Swift projects.

# Requirements
Toolbelt requires iOS 8.0 or OS X 10.10.

# Installation
Toolbelt can be installed using [Carthage](https://github.com/Carthage/Carthage), the latest [built-framework](https://github.com/alexanderedge/Toolbelt/releases/latest) or [source](/Toolbelt/Toolbelt).

1. Add `github alexanderedge/toolbelt 0.3.0` to your Cartfile
2. Run `carthage update`
3. Add `Toolbelt_iOS.framework` or `Toolbelt_Mac.framework` to your project in _Link Binary With Libraries_ build phase.

# Usage
For Objective-C, add `#import <Toolbelt_iOS/Toolbelt-Swift.h>` or `#import <Toolbelt_Mac/Toolbelt-Swift.h>` for iOS and Mac, respectively.

For Swift, add `import Toolbelt_iOS` or `import Toolbelt_Mac`.
