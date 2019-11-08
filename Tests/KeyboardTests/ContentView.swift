@testable import Keyboard
import SwiftUI

@available(iOS 13.0, *)
struct ContentView: View {
	@State var input = ""
	
	var body: some View {
		TextField("Text", text: $input)
			.raisesForKeyboard()
	}
}

@available(iOS 13.0, *)
struct ContentView_Previews: PreviewProvider {
	static var previews: some View {
		ContentView()
	}
}
