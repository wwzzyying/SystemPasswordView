# SystemPasswordView

A system-style password input view for iOS, built with SwiftUI.

![Platform](https://img.shields.io/badge/platform-iOS-lightgrey)
![Swift](https://img.shields.io/badge/Swift-6.0-orange)
![iOS](https://img.shields.io/badge/iOS-17.0%2B-blue)
[![CocoaPods](https://img.shields.io/cocoapods/v/SystemPasswordView.svg)](https://cocoapods.org/pods/SystemPasswordView)
[![SPM](https://img.shields.io/badge/Swift%20Package%20Manager-compatible-brightgreen.svg)](https://swift.org/package-manager/)

## Features

- System-style password input interface
- Haptic feedback
- Error animation with shake effect
- Native SwiftUI implementation

## Screenshots

<p float="left">
<img src="https://github.com/wwzzyying/Assets/blob/main/ScreenShot1.PNG" width="300">
<img src="https://github.com/wwzzyying/Assets/blob/main/ScreenShot2.gif" width="300">
</p>

## Requirements

- iOS 17.0+
- Swift 6.0+
- Xcode 15.0+

## Installation

### Swift Package Manager

Add the following to your `Package.swift` file:

```
dependencies: [
    .package(url: "https://github.com/wwzzyying/SystemPasswordView.git", from: "0.1.2")
]
```

Or add it through Xcode:
1. File > Add Packages...
2. Enter package URL: `https://github.com/wwzzyying/SystemPasswordView.git`
3. Select "Up to Next Major Version" with "0.1.2"

### CocoaPods

Add the following line to your Podfile:

```ruby
pod 'SystemPasswordView'
```

Then run:

```bash
pod install
```

## Usage

```swift
import SystemPasswordView

struct ContentView: View {
    @State private var showPasswordView = false
    
    var body: some View {
        Button("Show Password View") {
            showPasswordView = true
        }
        .sheet(isPresented: $showPasswordView) {
            SystemPasswordView(
                isPresented: $showPasswordView,
                title: "Enter Password",
                onComplete: { password in
                    // Validate password here
                    return password == "123456"
                }
            )
        }
    }
}
```

## Example

The password view will show a shake animation and haptic feedback when the password is incorrect:

```swift
SystemPasswordView(
    isPresented: $showPasswordView,
    title: "Enter Password") { password in
        // Return true if password is correct
        // Return false to trigger error animation
        return password == "123456"
    }
```

## Author

Jyuuroku Wu, jyuurokuu@gmail.com

## License

SystemPasswordView is available under the MIT license. See the [LICENSE](LICENSE) file for more info.