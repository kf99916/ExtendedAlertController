# ExtendedAlertController

ExtendedAlertController empowers your UIAlertController. This project is inspired by [AlertViewController](https://github.com/stringcode86/AlertViewController) and [alerts-and-pickers](https://github.com/dillidon/alerts-and-pickers).

[![GitHub stars](https://img.shields.io/github/stars/kf99916/ExtendedAlertController.svg)](https://github.com/kf99916/ExtendedAlertController/stargazers)
[![GitHub forks](https://img.shields.io/github/forks/kf99916/ExtendedAlertController.svg)](https://github.com/kf99916/ExtendedAlertController/network)
[![CocoaPods Compatible](https://img.shields.io/cocoapods/v/ExtendedAlertController.svg)](https://cocoapods.org/pods/ExtendedAlertController)
[![Platform](https://img.shields.io/cocoapods/p/ExtendedAlertController.svg)](https://github.com/kf99916/ExtendedAlertController)
[![GitHub license](https://img.shields.io/github/license/kf99916/ExtendedAlertController.svg)](https://github.com/kf99916/ExtendedAlertController/blob/master/LICENSE)

![ExtendedAlertController](/screenshots/extendedAlertController.png 'ExtendedAlertController')
![ExtendedAlertController](/screenshots/extendedAlertController-2.png 'ExtendedAlertController')

## Requirements

- iOS 9.0 or higher
- Swift 5

## Installation

### Swift Package Manager

The [Swift Package Manager](https://swift.org/package-manager/) is a tool for automating the distribution of Swift code and is integrated into the `swift` compiler.

Once you have your Swift package set up, adding ExtendedAlertController as a dependency is as easy as adding it to the `dependencies` value of your `Package.swift`.

```swift
dependencies: [
    .package(url: "https://github.com/kf99916/ExtendedAlertController")
]
```

### CocoaPods

[CocoaPods](https://cocoapods.org) is a dependency manager for Cocoa projects. For usage and installation instructions, visit their website. To integrate ExtendedAlertController into your Xcode project using CocoaPods, specify it in your `Podfile`:

```ruby
pod 'ExtendedAlertController'
```

## Usage

Just import this library and replace `UIAlertController` with `ExtendedAlertController` and you can:

- Customize the top view in your alert with `.top` or `.beyound` layout. For example, you can add `UIImageView` into your alert.
- Add custom `UIViewController` in your alert.
- A syntactic sugar `backgroundColor` to update background color in your alert.

Check out the demo project to get more details.

## Apps using ExtendedAlertController

If you are using ExtendedAlertController in your app and want to be listed here, simply create a pull request.

I am always curious who is using my projects :)

[Hikingbook](https://itunes.apple.com/app/id1067838748) - by Zheng-Xiang Ke

![Hikingbook](apps/Hikingbook.png)

## Demo

ExtendedAlertControllerDemo is a simple demo app.

## Author

Zheng-Xiang Ke, kf99916@gmail.com

## License

ExtendedAlertController is available under the MIT license. See the LICENSE file for more info.
