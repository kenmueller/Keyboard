import SwiftUI

@available(iOS 13.0, *)
extension View {
	func raisesForKeyboard() -> some View {
		KeyboardResponder { self }
	}
}
