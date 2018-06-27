// swift-tools-version:4.0

import PackageDescription

let package = Package(
    name: "Clibopencv",
    pkgConfig: "opencv",
    providers: [
        .apt(["libopencv-dev"])
    ],
    products: [ .library(name: "Clibopencv", targets: ["Clibopencv"]) ],
    dependencies: [
    ]
)
