// swift-tools-version:4.0

import PackageDescription

let package = Package(
    name: "libopencv",
    pkgConfig: "opencv",
    providers: [
        .apt(["libopencv-dev"])
    ],
    products: [ .library(name: "libopencv", targets: ["libopencv"]) ],
    dependencies: [
    ]
)
