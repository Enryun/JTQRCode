// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "JTQRCode",
    platforms: [
        .iOS(.v15)
    ],
    products: [
        .library(
            name: "JTQRCode",
            targets: ["JTQRCode"]),
    ],
    targets: [
        .target(
            name: "JTQRCode",
            path: "./Sources/JTQRCode"
        )
    ]
)
