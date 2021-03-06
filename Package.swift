// swift-tools-version:5.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "CollectionTools",
    
    platforms: [
        .macOS(.v10_15),
        .iOS(.v13),
        .tvOS(.v13),
        .watchOS(.v6),
    ],
    
    products: [
        // Products define the executables and libraries produced by a package, and make them visible to other packages.
        .library(
            name: "CollectionTools",
            targets: ["CollectionTools"]),
    ],
    
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        .package(name: "FunctionTools", url: "https://github.com/RougeWare/Swift-Function-Tools", from: "1.2.0"),
    ],
    
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages which this package depends on.
        .target(
            name: "CollectionTools",
            dependencies: ["FunctionTools"]),
        .testTarget(
            name: "CollectionToolsTests",
            dependencies: ["CollectionTools"]),
    ]
)
