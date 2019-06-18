//
//  HintTextField.swift
//  HeadsAndHands
//
//  Created by Hadevs on 18/06/2019.
//  Copyright © 2019 Hadevs. All rights reserved.
//

import UIKit

class HintTextView: UIView {
	
	// MARK: Public configuration
	var placeholder: String? {
		get {
			return placeholderLabel.text
		}
		
		set {
			placeholderLabel.text = newValue
		}
	}
	
	var delegate: UITextFieldDelegate? {
		get {
			return textField.delegate
		}
		
		set {
			textField.delegate = newValue
		}
	}
	
	var buttonText: String? {
		get {
			return button.titleLabel?.text
		}
		
		set {
			button.setTitle(newValue, for: .normal)
		}
	}
	
	var buttonPressed: (() -> Void)?
	
	// MARK: Internal Views
	private let placeholderLabel = UILabel()
	private let separatorView = UIView()
	private let button = RectButton()
	let textField = UITextField()
	
	// MARK: Support internal properties
	private var textFieldHeightConstraint: NSLayoutConstraint?
	private var buttonWidthConstraint: NSLayoutConstraint?
	
	// MARK: Private configuration
	private let placeholderFont = UIFont.systemFont(ofSize: 13)
	private let textFieldFont = UIFont.systemFont(ofSize: 16)
	private let placeholderColor = Color.brownGrey
	private let textFieldColor = Color.black
	private let separatorColor = Color.veryLightPink
	private let defaultTextFieldHeight: CGFloat = 19
	private let defaultButtonHeight: CGFloat = 113
	private let defaultAnimationDuration: TimeInterval = 0.25
	
	override func didMoveToSuperview() {
		super.didMoveToSuperview()
		addSeparatorView()
		addTextField()
		addPlaceholderLabel()
		setupMinimumHeight()
		addButton()
		addTagrets()
	}
	
	private func addTagrets() {
		button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
	}
	
	@objc private func buttonAction() {
		buttonPressed?()
	}
	
	private func addButton() {
		addSubview(button)
		button.translatesAutoresizingMaskIntoConstraints = false
		buttonWidthConstraint = button.widthAnchor.constraint(equalToConstant: 0)
		buttonWidthConstraint?.isActive = true
		button.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
		button.leadingAnchor.constraint(equalTo: textField.trailingAnchor).isActive = true
		button.bottomAnchor.constraint(equalTo: textField.bottomAnchor, constant: -4).isActive = true
		button.heightAnchor.constraint(equalToConstant: 30).isActive = true
	}
	
	private func setupMinimumHeight() {
		heightAnchor.constraint(greaterThanOrEqualToConstant: 45).isActive = true
	}
	
	private func addSeparatorView() {
		addSubview(separatorView)
		separatorView.backgroundColor = separatorColor
		separatorView.translatesAutoresizingMaskIntoConstraints = false
		separatorView.heightAnchor.constraint(equalToConstant: 1).isActive = true
		separatorView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
		separatorView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
		separatorView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
	}
	
	func showTextField() {
		UIView.animate(withDuration: defaultAnimationDuration) {
			self.textFieldHeightConstraint?.constant = self.defaultTextFieldHeight
			self.layoutIfNeeded()
		}
		textField.becomeFirstResponder()
	}
	
	func showButton(animated: Bool = false) {
		UIView.animate(withDuration: animated ? defaultAnimationDuration : 0) {
			self.buttonWidthConstraint?.constant = self.defaultButtonHeight
			self.layoutIfNeeded()
		}
	}
	
	func hideButton() {
		UIView.animate(withDuration: defaultAnimationDuration) {
			self.buttonWidthConstraint?.constant = 0
			self.layoutIfNeeded()
		}
	}
	
	override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
		super.touchesBegan(touches, with: event)
		
		showTextField()
	}
	
	func hideTextField() {
		UIView.animate(withDuration: defaultAnimationDuration) {
			self.textFieldHeightConstraint?.constant = 0
			self.layoutIfNeeded()
		}
	}
	
	private func addTextField() {
		textField.font = textFieldFont
		textField.textColor = textFieldColor
		
		addSubview(textField)
		textField.translatesAutoresizingMaskIntoConstraints = false
		textFieldHeightConstraint = textField.heightAnchor.constraint(equalToConstant: 0)
		textFieldHeightConstraint?.isActive = true
		textField.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
		textField.bottomAnchor.constraint(equalTo: separatorView.topAnchor, constant: -4).isActive = true
	}
	
	private func addPlaceholderLabel() {
		addSubview(placeholderLabel)
		placeholderLabel.font = placeholderFont
		placeholderLabel.textColor = placeholderColor
		placeholderLabel.translatesAutoresizingMaskIntoConstraints = false
		placeholderLabel.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
		placeholderLabel.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
		placeholderLabel.topAnchor.constraint(equalTo: topAnchor).isActive = true
		placeholderLabel.bottomAnchor.constraint(equalTo: textField.topAnchor).isActive = true
	}
}
