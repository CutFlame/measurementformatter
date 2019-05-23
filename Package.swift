// swift-tools-version:5.0
import PackageDescription

let package = Package(
    name: "MeasurementFormatter",
    platforms: [ .macOS(.v10_12) ],
    dependencies: [
        // 💧 A server-side Swift web framework.
        .package(url: "https://github.com/vapor/vapor.git", from: "3.0.0"),

        // 🍃 An expressive, performant, and extensible templating language built for Swift.
        .package(url: "https://github.com/vapor/leaf.git", from: "3.0.0")
    ],
    targets: [
        .target(name: "App", dependencies: ["Leaf", "Vapor"], exclude: ["derivedData"]),
        .target(name: "Run", dependencies: ["App"], exclude: ["derivedData"]),
        .testTarget(name: "AppTests", dependencies: ["App"])
    ],
    swiftLanguageVersions: [ .v5 ]
)
