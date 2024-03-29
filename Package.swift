// swift-tools-version:5.1

import PackageDescription

let package = Package(
	name: "Keyboard",
	products: [
		.library(
			name: "Keyboard",
			targets: ["Keyboard"]
		)
	],
	targets: [
		.target(name: "Keyboard"),
		.testTarget(
			name: "KeyboardTests",
			dependencies: ["Keyboard"]
		)
	]
)
