import SwiftUI

@available(iOS 13.0, *)
public extension View {
	func raisesForKeyboard(
		animation: Animation = Keyboard.defaultAnimation
	) -> some View {
		KeyboardResponder(animation: animation) { self }
	}
}
