//
//  AuthViewController.swift
//  HeadsAndHands
//
//  Created by Hadevs on 18/06/2019.
//  Copyright © 2019 Hadevs. All rights reserved.
//

import UIKit

class AuthViewController: UIViewController {
	
	// MARK: Outlets
	@IBOutlet weak var emailTextView: HintTextView!
	@IBOutlet weak var passwordTextView: HintTextView!
	@IBOutlet weak var enterButton: UIButton!
	@IBOutlet weak var registerButtonBottomConstraint: NSLayoutConstraint!
	
	// MARK: Depndencies
	private let presenter = AuthPresenter()
	
	// MARK: Private configuration
	private let defaultBottomPadding: CGFloat = 16
	
	override func viewDidLoad() {
		super.viewDidLoad()
		presenter.view = self
		presenter.viewDidLoad()
		title = "Авторизация"
		configureEmailTextView()
		configurePasswordTextView()
		delegateTextViews()
		addTagrets()
		observeKeyboardEvents()
	}
	
	@IBAction func enterButtonPressed() {
		presenter.enterButtonPressed()
	}

	private func observeKeyboardEvents() {
		let center = NotificationCenter.default
		center.addObserver(self, selector: #selector(keyboardWillShow(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
		center.addObserver(self, selector: #selector(keyboardWillHide(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
	}
	
	deinit {
		NotificationCenter.default.removeObserver(self)
	}
	
	@objc func keyboardWillShow(notification: Notification) {
		if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
			let newPadding = keyboardSize.height
			registerButtonBottomConstraint.constant = newPadding + defaultBottomPadding
			UIView.animate(withDuration: 0.25) {
				self.view.layoutIfNeeded()
			}
		}
	}
	
	@objc func keyboardWillHide(notification: Notification) {
		registerButtonBottomConstraint.constant = defaultBottomPadding
		UIView.animate(withDuration: 0.25) {
			self.view.layoutIfNeeded()
		}
	}
	
	override func viewDidLayoutSubviews() {
		super.viewDidLayoutSubviews()
		
		enterButton.layer.cornerRadius = enterButton.frame.height / 2
	}
	
	private func addTagrets() {
		passwordTextView.buttonPressed = { [weak self] in
			self?.showAlert(title: "Заглушка", message: "Ссылка с паролем отправлена Вам на почту.")
		}
	}
	
	func showAlert(title: String, message: String) {
		let alertController = UIAlertController(title: title,
																						message: message, preferredStyle: .alert)
		alertController.addAction(UIAlertAction.init(title: "OK", style: .cancel, handler: nil))
		present(alertController, animated: true, completion: nil)
	}
	
	private func delegateTextViews() {
		emailTextView.delegate = presenter
		passwordTextView.delegate = presenter
	}
	
	func resignAllFields() {
		emailTextView.hideTextField()
		passwordTextView.hideTextField()
	}
	
	private func configureEmailTextView() {
		emailTextView.placeholder = "Почта"
		emailTextView.textField.autocapitalizationType = .none
		emailTextView.textField.keyboardType = .emailAddress
		emailTextView.textField.autocorrectionType = .no
	}
	
	private func configurePasswordTextView() {
		passwordTextView.buttonText = "Забыли пароль?"
		passwordTextView.showButton()
		passwordTextView.placeholder = "Пароль"
		passwordTextView.textField.isSecureTextEntry = true
	}
}
