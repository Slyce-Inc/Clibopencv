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
    .package(url: "git@github.com:ilmco/Clibfreetype.git", .branch("master")),
    .package(url: "git@github.com:ilmco/Clibharfbuzz.git", .branch("master")),
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
