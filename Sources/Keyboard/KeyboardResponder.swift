import SwiftUI


@available(iOS 13.0, *)
public struct KeyboardResponder<Content: View>: View {
	@ObservedObject private var keyboard = Keyboard()
	
	private var animation: Animation?
	private var contentWithParameter: ((CGFloat) -> Content)?
	private var content: Content?
	
	public init(
		animation: Animation? = Keyboard.defaultAnimation,
		@ViewBuilder content: @escaping (CGFloat) -> Content
	) {
		self.animation = animation
		contentWithParameter = content
	}
	
	public init(
		animation: Animation = Keyboard.defaultAnimation,
		@ViewBuilder content: () -> Content
	) {
		self.animation = animation
		self.content = content()
	}
	
	public var body: some View {
		VStack {
			(content ?? contentWithParameter?(keyboard.currentHeight))?
				.padding(.bottom, animation == nil ? 0 : keyboard.currentHeight)
				.animation(animation)
		}
	}
}
