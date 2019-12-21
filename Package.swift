// swift-tools-version:4.2

import PackageDescription

let package = Package(
  name: "Clibopencv",
  products: [
    .library(name: "Clibopencv", targets: ["Clibopencv"]),
    .library(name: "OpenCV", targets: ["OpenCV"])
  ],
  dependencies: [
    .package(url: "https://github.com/Slyce-Inc/Clibfreetype.git", .branch("master")),
    .package(url: "https://github.com/Slyce-Inc/Clibharfbuzz.git", .branch("master")),
  ],
  targets: [
    .systemLibrary(name:"Clibopencv", pkgConfig: "opencv4"),
    .target(
      name: "OpenCV",
      dependencies: [
        "Clibharfbuzz",
        "Clibfreetype"
      ]
    )
  ]
)
