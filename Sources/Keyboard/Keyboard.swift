import SwiftUI

@available(iOS 13.0, *)
public final class Keyboard: ObservableObject {
	public static let defaultAnimation = Animation.easeOut(duration: 0.5)
	
	@Published public var currentHeight: CGFloat = 0
	
	private let notificationCenter = NotificationCenter.default
	
	public var maxHeight: CGFloat?
	
	public init() {
		notificationCenter.addObserver(
			self,
			selector: #selector(keyboardWillShow),
			name: UIResponder.keyboardWillShowNotification,
			object: nil
		)
		notificationCenter.addObserver(
			self,
			selector: #selector(keyboardWillHide),
			name: UIResponder.keyboardWillHideNotification,
			object: nil
		)
	}
	
	deinit {
		notificationCenter.removeObserver(self)
	}
	
	@objc
	private func keyboardWillShow(notification: Notification) {
		guard let height = (
			notification.userInfo?[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue
		)?.cgRectValue.height else {
			return print("Keyboard: Unable to get keyboard height")
		}
		currentHeight = height
		maxHeight = height
	}
	
	@objc
	private func keyboardWillHide() {
		currentHeight = 0
	}
}
