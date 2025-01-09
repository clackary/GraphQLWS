// swift-tools-version:5.9

import PackageDescription

let package = Package(
    name: "GraphQLWS",
    products: [
        .library(
            name: "GraphQLWS",
            targets: ["GraphQLWS"]
        ),
    ],
    dependencies: [
        .package(name: "Graphiti", url: "https://github.com/GraphQLSwift/Graphiti.git", from: "1.0.0"),
        .package(name: "GraphQL", url: "https://github.com/GraphQLSwift/GraphQL.git", from: "2.2.1"),
        // TODO: Move back over to mainline GraphQLRxSwift once one of the following issues are resolved
        // https://github.com/swiftlang/swift-corelibs-foundation/issues/5108
        // https://github.com/ReactiveX/RxSwift/issues/2621
        .package(url: "https://github.com/PassiveLogic/GraphQLRxSwift.git", exact: "0.0.5-pl.1"),
        // TODO: Move back over to mainline RxSwift once one of the following issues are resolved
        // https://github.com/swiftlang/swift-corelibs-foundation/issues/5108
        // https://github.com/ReactiveX/RxSwift/issues/2621
        .package(url: "https://github.com/PassiveLogic/RxSwift.git", exact: "6.8.1-pl.1"),
        .package(name: "swift-nio", url: "https://github.com/apple/swift-nio.git", from: "2.33.0")
    ],
    targets: [
        .target(
            name: "GraphQLWS",
            dependencies: [
                .product(name: "Graphiti", package: "Graphiti"),
                .product(name: "GraphQLRxSwift", package: "GraphQLRxSwift"),
                .product(name: "GraphQL", package: "GraphQL"),
                .product(name: "NIO", package: "swift-nio"),
                .product(name: "RxSwift", package: "RxSwift")
            ]),
        .testTarget(
            name: "GraphQLWSTests",
            dependencies: ["GraphQLWS"]
        ),
    ]
)
