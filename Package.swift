// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "MMPagingView",
    platforms: [.iOS(.v14), .macOS(.v12)],
    products: [
        .library(
            name: "MMPagingView",
            targets: ["MMPagingView"]),
    ],
    dependencies: [
    ],
    targets: [
        .target(
            name: "MMPagingView",
            dependencies: [])
    ]
)
