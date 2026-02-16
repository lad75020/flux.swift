// swift-tools-version: 5.9

import PackageDescription

let package = Package(
  name: "flux.swift",
  platforms: [.macOS(.v14), .iOS(.v16)],
  products: [
    .library(
      name: "FluxSwift",
      targets: ["FluxSwift"])
  ],
  dependencies: [
    // Keep aligned with projects using recent MLX + swift-transformers
    .package(url: "https://github.com/ml-explore/mlx-swift", .upToNextMinor(from: "0.30.3")),
    .package(url: "https://github.com/huggingface/swift-transformers", .upToNextMinor(from: "1.1.6")),
    .package(url: "https://github.com/apple/swift-log.git", from: "1.5.3")
  ],
  targets: [
    .target(
      name: "FluxSwift",
      dependencies: [
        .product(name: "MLX", package: "mlx-swift"),
        .product(name: "MLXFast", package: "mlx-swift"),
        .product(name: "MLXNN", package: "mlx-swift"),
        .product(name: "MLXOptimizers", package: "mlx-swift"),
        .product(name: "MLXRandom", package: "mlx-swift"),
        .product(name: "Hub", package: "swift-transformers"),
        .product(name: "Tokenizers", package: "swift-transformers"),
        .product(name: "Logging", package: "swift-log"),
      ]
    ),
    .testTarget(
      name: "FluxSwiftTests",
      dependencies: ["FluxSwift"],
      path: "Tests"
    ),
  ]
)
