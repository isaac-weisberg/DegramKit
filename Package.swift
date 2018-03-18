// swift-tools-version:4.0

import PackageDescription

let package = Package(
    name: "DegramKit",
    products: [
        .library(
            name: "DegramKit",
            targets: [ "DegramKit" ]),
    ],
    dependencies: [
        
    ],
    targets: [
        .target(
            name: "DegramKit",
            dependencies: []),
        .testTarget(
            name: "DegramKitTests",
            dependencies: ["DegramKit"]),
    ]
)
