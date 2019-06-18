//
//  AuthViewControllerPresenter.swift
//  HeadsAndHands
//
//  Created by Hadevs on 18/06/2019.
//  Copyright © 2019 Hadevs. All rights reserved.
//

import UIKit

class AuthPresenter: NSObject, Lifecycable {
	weak var view: AuthViewController?
	private let interactor = AuthInteractor()

	func enterButtonPressed() {
		let password = view?.passwordTextView.textField.text ?? ""
		guard PasswordValidator(password).validate() else {
			view?.showAlert(title: "Ошибка", message: "Пароль - минимум 6 символов, должен обязательно содержать минимум 1 строчную букву, 1 заглавную, и 1 цифру.")
			return
		}
		
		let email = view?.emailTextView.textField.text ?? ""
		
		guard EmailValidator(email).validate() else {
			view?.showAlert(title: "Ошибка", message: "Введите валидный Email.")
			return
		}
		
		interactor.fetchWeather { [weak self] (result) in
			switch result {
			case .error(let error):
				self?.view?.showAlert(title: "Ошибка", message: error)
			case .success(let model):
				self?.view?.showAlert(title: "Погода", message: "В дождливом лондоне сейчас \(model.main?.temp ?? 0) градусов по фаренгейту")
			}
		}
	}
}

extension AuthPresenter: UITextFieldDelegate {
	func textFieldDidEndEditing(_ textField: UITextField) {
		guard textField.text?.isEmpty ?? true else {
			return
		}
		view?.resignAllFields()
	}
	
	func textFieldShouldReturn(_ textField: UITextField) -> Bool {
		textField.resignFirstResponder()
		return true
	}
}
