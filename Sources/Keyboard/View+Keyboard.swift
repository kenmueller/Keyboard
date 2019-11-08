import SwiftUI

@available(iOS 13.0, *)
public extension View {
	func raisesForKeyboard() -> some View {
		KeyboardResponder { self }
	}
}
