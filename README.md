# JTQRCode

![iOS 15.0+](https://img.shields.io/badge/iOS-15.0%2B-blue.svg)
[![Pod Version](http://img.shields.io/cocoapods/v/SDWebImage.svg?style=flat)](https://cocoapods.org/pods/Tutorials)
[![Swift Package Manager](https://img.shields.io/badge/Swift%20Package%20Manager-compatible-brightgreen.svg)](https://github.com/apple/swift-package-manager)
[![License](https://img.shields.io/badge/license-MIT-blue.svg?style=flat)](http://mit-license.org)

## Table of Contents
1. [Overview](#overview)
2. [Requirements](#requirements)
3. [Installation](#installation)
4. [Features](#features)
5. [QRGenerator](#qrgenerator)
   - [QRGeneratorView](#qrgeneratorview)
   - [QRCodeGenerator](#qrcodegenerator)
6. [QRScanner](#qrscanner)
7. [QRScanningButton](#qrscanningbutton)
8. [Torch](#torch)
9. [Author](#author)

## Overview

`JTQRCode` is a powerful SwiftUI framework that simplifies the integration of QR code functionality into your iOS applications. With a suite of customizable components, our SDK allows you to generate, display, and scan QR codes effortlessly, enhancing the user experience within your app.

<img src="https://github.com/user-attachments/assets/37a30266-bd24-4b01-99b5-c002a4941d81" width="220">
<img src="https://github.com/user-attachments/assets/84dc2277-2a95-4ace-a819-a857ece9510a" width="220">
<img src="https://github.com/user-attachments/assets/4ab89389-ffcf-4c54-864a-89855f7fe152" width="220">

## Requirements

| Platform | Minimum Version |
|----------|-----------------|
| iOS      | 15.0            |

 ## Installation
This project can be installed using `Swift Package Manager` and `CocoaPod`.

### Swift Package Manager

1. Open your project in Xcode.
2. Navigate to `File` > `Swift Packages` > `Add Package Dependency`.
3. Paste the repository URL: `https://github.com/Enryun/JTQRCode`
4. Follow the prompts to add the package to your project.

For more details on using Swift Package Manager, visit [Apple's Swift Package Manager documentation](https://swift.org/package-manager/).

### CocoaPods

[CocoaPods](http://cocoapods.org/) is a dependency manager for Objective-C, which automates and simplifies the process of using 3rd-party libraries in your projects. See the [Get Started](http://cocoapods.org/#get_started) section for more details.

Add the following entry to your Podfile:

```rb
pod 'JTQRCode'
```

Then run `pod install`.

Don't forget to `import JTQRCode` in every file you'd like to use it.

## Features

- **SwiftUI Focused**: Specifically designed for SwiftUI, ensuring smooth integration and native performance on iOS devices.
- **User-Friendly**: Intuitive APIs and components reduce development time and complexity.
- **High Performance**: Utilizes optimized algorithms and Core Image for fast QR code generation and scanning.
- **Customizable Components**: Easily adjust sizes, colors, and styles to fit your app's theme.
- **Comprehensive Documentation**: Includes detailed guides and examples to help you get started quickly.

## QRGenerator

## QRGeneratorView

`QRGeneratorView` is a SwiftUI view component that generates and displays a QR code from various input types.

```swift
QRGeneratorView(input: .url(URL(string: "https://www.linkedin.com/in/jamesthang/")!))
QRGeneratorView(input: .string("CommonSwiftUI"))
QRGeneratorView(input: .data(Data("James Thang".utf8)))
```

`QRGeneratorView` creates a QR code image based on the provided input, which can be a` String`, `URL`, or `Data`. It displays the generated QR code image or an error message if the QR code generation fails.

<img src="https://github.com/user-attachments/assets/37a30266-bd24-4b01-99b5-c002a4941d81" width="220">

Parameters:
- `input`: The data used to generate the QR code, specified by the [QRCodeInputType](#QRCodeInputType) enumeration.

#### QRCodeInputType

Defines the types of inputs that can be used to generate a QR code in `QRGeneratorView`.

Cases:
- `string`: A simple string to be encoded into a QR code.
- `url`: A URL object representing a web address.
- `data`: Arbitrary data, such as binary encoded information.

This enumeration simplifies the process of selecting and processing different kinds of data to generate a QR code.

This component simplifies the process of QR code generation and display within SwiftUI views, handling different input types seamlessly.

## QRCodeGenerator

The `QRCodeGenerator` provides static methods to create QR code images from different data sources such as strings, URLs, and binary data. It utilizes Core Image's built-in QR code generation capabilities to transform input data into visual QR code formats that can be scanned by QR code readers.

Features
- **Generate QR Codes from Strings, URLs, or Data**: Easily create QR codes from common data types.
- **Customization Options**: Specify size, colors, error correction levels, and embed logos.
- **Error Handling**: Methods throw `QRCodeGenerationError` to provide detailed error information.

Methods:
- `generateQRCode(from string: String, ...)`: Generates a QR code image from a string.
- `generateQRCode(from url: URL, ...)`: Generates a QR code image from a URL.
- `generateQRCode(from data: Data, ...)`: Generates a QR code image directly from binary data.

<img src="https://github.com/user-attachments/assets/bb1ff5d6-5af5-4a96-b5b7-e54522c17fbe" width="220">
<img src="https://github.com/user-attachments/assets/02bf47ae-77a9-4d28-9312-873014e51d20" width="220">
<img src="https://github.com/user-attachments/assets/84dc2277-2a95-4ace-a819-a857ece9510a" width="220">

A utility struct for generating QR codes from various types of inputs with options for customization.

## QRScanner

A robust QR code scanner view for SwiftUI, providing interactive scanning capabilities.

```swift
QRScannerView(isScanning: $isScanning) { result in
    switch result {
    case .success(let code):
        print("Scanned code: \(code)")
    case .failure(let error):
        print("Scanning failed: (error.localizedDescription)")
    }
}
```

Parameters:
- `isScanning`: A binding to control the scanning process.
- `showScanningAnimation`: A Boolean value that determines whether to show a scanning animation.
- `scanningTint`: The color of the scanning animation.
- `showTorch`: A Boolean value that determines whether to show a torch toggle button.
- `showErrorAlert`: A Boolean value that determines whether to show an alert on scanning errors.
- `completion`: A closure executed with the scanning result, returning a `String` on success or an `Error` on failure.

`QRScannerView` integrates camera functionality to scan QR codes and handle the results dynamically through a completion handler. It supports customization of scanning animation and error handling.

```swift
@State var isScanning: Bool = false
@State var successResult: String = ""

var body: some View {
    VStack(spacing: 20) {
        Text(successResult)
            .font(.title)
            .fontWeight(.semibold)
        
        QRScannerView(isScanning: $isScanning, showScanningAnimation: true, showErrorAlert: false) { result in
            switch result {
            case .success(let result):
                successResult = result
            case .failure(let error):
                print("This is Error Cases")
                print(error)
                print(error.localizedDescription)
            }
        }
        
        Button("Start Scanning") {
            successResult = ""
            isScanning = true
        }
        
        Button("Stop Scanning") {
            successResult = ""
            isScanning = false
        }
    }
}
```

https://github.com/user-attachments/assets/5d320f81-59a1-4581-99dd-b3efb1566532

This component is designed to provide a seamless integration of QR scanning functionality within your SwiftUI applications, enhancing user interaction and data capture capabilities.

## QRScanningButton

A customizable button for initiating QR code scanning in SwiftUI.

```swift
QRScanningButton { }
```

Parameters:
- `color`: The foreground color of the QR code icon inside the button.
- `backgroundColor`: The background color of the button.
- `shape`: The shape of the button, conforming to the `Shape` protocol.
- `showsScanningAnimation`: A Boolean that determines whether a scanning animation is shown.
- `action`: The closure executed when the button is tapped.

This view component creates a button designed for QR code scanning functionalities. It incorporates an optional scanning animation and can be styled extensively with colors and custom shapes.

```swift
QRScanningButton(color: .white, backgroundColor: .purple) {
    // Toggle Scanning using the QRScannerView from this SDK
}
.frame(width: 80, height: 80, alignment: .center)
```

https://github.com/user-attachments/assets/52883084-bec6-481c-b81f-ff0fd0015fe9

This setup uses a `QRScanningButton` with a rounded rectangle shape, changing state when tapped, triggering a scanning animation.

## Torch

Manages the torch mode on a device with camera capabilities.

```swift
TorchControl(isOn: false)
```

Parameters:
- `isOn`: A `Bool` that indicates whether the torch should be on or off.

`TorchControl` provides an interface to toggle the torch (flashlight) of a device's camera on or off. It reacts to changes in the `isOn` property to control the torch state.

```swift
@StateObject var torchState = TorchControl(isOn: false)

var body: some View {
    VStack {
        Toggle(isOn: $torchState.isOn) {
            Text("Torch Mode")
        }
        Button(action: {
            torchState.isOn.toggle()
        }) {
            Text("Toggle Torch")
        }
    }
}
```

This class utilizes `AVCaptureDevice` to manage the torch settings and handles configuration and error states internally. Ensure that the device has a torch and the app has the necessary permissions to use the camera.

## Author
James Thang, find me on [LinkedIn](https://www.linkedin.com/in/jamesthang/)
