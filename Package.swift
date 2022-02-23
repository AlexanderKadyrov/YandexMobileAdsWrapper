// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "YandexMobileAdsWrapper",
    products: [
        .library(
            name: "YandexMobileAdsWrapper",
            targets: ["YandexMobileAdsWrapper", "YandexMobileAds"]
        ),
    ],
    dependencies: [
        .package(name: "YandexMobileMetrica", url: "https://github.com/yandexmobile/metrica-sdk-ios", .exact("4.0.0"))
    ],
    targets: [
        .binaryTarget(
            name: "YandexMobileAds",
            url: "https://github.com/AlexanderKadyrov/YandexMobileAdsStorage/raw/master/4.4.2/YandexMobileAds.zip",
            checksum: "c093b1b03c8d755e1a4bee9def1bf1f06734aa892758340dfff8850bda1636f8"
        ),
        .target(
            name: "YandexMobileAdsWrapper",
            dependencies: [
                .target(name: "YandexMobileAds", condition: .when(platforms: .some([.iOS]))),
                "YandexMobileMetrica"
            ],
            linkerSettings: [
                .linkedLibrary("sqlite3"),
                .linkedLibrary("c++"),
                .linkedLibrary("z"),
                .linkedLibrary("xml2"),
                .linkedFramework("StoreKit"),
                .linkedFramework("Security"),
                .linkedFramework("SafariServices"),
                .linkedFramework("SystemConfiguration"),
                .linkedFramework("UIKit"),
                .linkedFramework("Foundation"),
                .linkedFramework("CoreTelephony"),
                .linkedFramework("CoreLocation"),
                .linkedFramework("CoreGraphics"),
                .linkedFramework("AdSupport"),
                .linkedFramework("WebKit"),
                .linkedFramework("AVFoundation"),
                .linkedFramework("CoreMedia"),
                .unsafeFlags(["-ObjC"])
            ]
        )
    ]
)
