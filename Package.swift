// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SpmWithRealm",
    products: [
        .library(
            name: "OtherSPM",
            targets: ["OtherSPM"]
        ),
        .library(
            name: "SpmWithRealm",
            targets: ["SpmWithRealm"]
        )
    ],
    dependencies: [
        .package(url: "https://github.com/realm/realm-swift", .upToNextMajor(from: "10.46.0"))
    ],
    targets: [
        .target(
            name: "OtherSPM",
            dependencies: []
        ),
        .target(
            name: "SpmWithRealm",
            dependencies: [
                "OtherSPM",
                .product(name: "RealmSwift", package: "realm-swift")
            ]
        ),
        .testTarget(
            name: "SpmWithRealmTests",
            dependencies: ["SpmWithRealm"]
        ),
    ]
)
