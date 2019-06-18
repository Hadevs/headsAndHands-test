//
//  EmailValidator.swift
//  HeadsAndHands
//
//  Created by Hadevs on 18/06/2019.
//  Copyright © 2019 Hadevs. All rights reserved.
//

import Foundation

class EmailValidator {
	private let email: String
	init(_ email: String) {
		self.email = email
	}
	
	func validate() -> Bool {
		let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
		
		let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
		return emailTest.evaluate(with: email)
	}
}
