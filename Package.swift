// swift-tools-version:5.0

import PackageDescription

#if os(Linux)
import Foundation

let fileManager = FileManager.default
guard let pcFileToUse = (try! fileManager.contentsOfDirectory(atPath:"/usr/lib/pkgconfig")
  .filter { $0.hasPrefix("opencv") && $0.hasSuffix(".pc") }
  .sorted()
  .last) else {
  fatalError("Unable to locate a .pc for opencv")
}
let versionToUse = NSURL(fileURLWithPath:pcFileToUse).deletingPathExtension!.lastPathComponent
#else
let versionToUse = "opencv"
#endif


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
    .systemLibrary(name:"Clibopencv", pkgConfig: versionToUse),
    .target(
      name: "OpenCV",
      dependencies: [
        "Clibharfbuzz",
        "Clibfreetype"
      ]
    )
  ]
)
