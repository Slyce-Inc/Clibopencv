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
    .package(url: "https://github.com/theia-ai/Clibfreetype.git", .branch("master")),
    .package(url: "https://github.com/theia-ai/Clibharfbuzz.git", .branch("master")),
  ],
  targets: [
    .target(
      name: "Clibopencv",
      dependencies: [
        "Clibharfbuzz",
        "Clibfreetype"
      ]
    )
  ]
)
