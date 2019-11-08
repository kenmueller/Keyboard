import Combine
import UIKit

@available(iOS 13.0, *)
public final class Keyboard: ObservableObject {
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
			return print("KeyboardResponder: Unable to get keyboard height")
		}
		currentHeight = height
		maxHeight = height
	}
	
	@objc
	private func keyboardWillHide() {
		currentHeight = 0
	}
}
