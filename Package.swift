// swift-tools-version:4.2

import PackageDescription

let package = Package(
  name: "Clibopencv",
  products: [
    .library(name: "Clibopencv", targets: ["Clibopencv"]),
    .library(name: "OpenCV", targets: ["OpenCV"])
  ],
  dependencies: [
    .package(url: "git@github.com:Slyce-Inc/Clibfreetype.git", .branch("master")),
    .package(url: "git@github.com:Slyce-Inc/Clibharfbuzz.git", .branch("master")),
  ],
  targets: [
    .systemLibrary(name:"Clibopencv", pkgConfig: "opencv"),
    .target(
      name: "OpenCV",
      dependencies: [
        "Clibharfbuzz",
        "Clibfreetype"
      ]
    )
  ]
)
