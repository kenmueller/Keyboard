import SwiftUI

@available(iOS 13.0, *)
extension View {
	public func raisesForKeyboard() -> some View {
		KeyboardResponder { self }
	}
}
