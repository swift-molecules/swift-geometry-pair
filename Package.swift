// swift-tools-version: 6.4

import PackageDescription

let package = Package(
    name: "swift-geometry-pair",
    platforms: [
        .macOS(.v27),
        .iOS(.v27),
        .tvOS(.v27),
        .watchOS(.v27),
        .visionOS(.v27),
    ],
    products: [
        .library(
            name: "Geometry Pair",
            targets: ["Geometry Pair"]
        ),
    ],
    dependencies: [
        .package(
            url: "https://github.com/swift-atoms/swift-geometry.git",
            branch: "main"
        ),
        .package(
            url: "https://github.com/swift-atoms/swift-pair.git",
            branch: "main"
        ),
    ],
    targets: [
        .target(
            name: "Geometry Pair",
            dependencies: [
                .product(name: "Geometry", package: "swift-geometry"),
                .product(name: "Pair", package: "swift-pair"),
            ]
        ),
        .testTarget(
            name: "Geometry Pair Tests",
            dependencies: [
                "Geometry Pair",
                .product(name: "Geometry", package: "swift-geometry"),
                .product(name: "Pair", package: "swift-pair"),
            ]
        ),
    ],
    swiftLanguageModes: [.v6]
)

for target in package.targets where ![.system, .binary, .plugin, .macro].contains(target.type) {
    let ecosystem: [SwiftSetting] = [
        .strictMemorySafety(),
        .enableUpcomingFeature("ExistentialAny"),
        .enableUpcomingFeature("InternalImportsByDefault"),
        .enableUpcomingFeature("MemberImportVisibility"),
        .enableUpcomingFeature("NonisolatedNonsendingByDefault"),
        .enableExperimentalFeature("Lifetimes"),
        .enableUpcomingFeature("InferIsolatedConformances"),
    ]

    let package: [SwiftSetting] = []

    target.swiftSettings = (target.swiftSettings ?? []) + ecosystem + package
}
