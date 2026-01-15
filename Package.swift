// swift-tools-version:5.9

import PackageDescription
import CompilerPluginSupport



let package = Package(
    name: "CollectionTools",
    
    platforms: [
        .macOS(.v10_15),
        .iOS(.v13),
        .tvOS(.v13),
        .watchOS(.v6),
    ],
    
    products: [
        .library(
            name: "CollectionTools",
            targets: ["CollectionTools"]
        ),
    ],
    
    dependencies: [
        .package(url: "https://github.com/RougeWare/Swift-Function-Tools", from: "1.2.0"),
        .package(url: "https://github.com/apple/swift-syntax.git", from: "509.0.0"),
    ],
    
    targets: [
        .macro(
            name: "CollectionToolsMacros",
            dependencies: [
                .product(name: "SwiftSyntaxMacros", package: "swift-syntax"),
                .product(name: "SwiftCompilerPlugin", package: "swift-syntax"),
            ]
        ),
        
        .target(
            name: "CollectionTools",
            dependencies: [
                .product(name: "FunctionTools", package: "Swift-Function-Tools"),
                "CollectionToolsMacros",
            ]
        ),
        
        .testTarget(
            name: "CollectionToolsTests",
            dependencies: [
                "CollectionTools",
                .product(name: "SwiftSyntaxMacrosTestSupport", package: "swift-syntax"),
            ]
        ),
    ]
)
