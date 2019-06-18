//
//  PasswordValidator.swift
//  HeadsAndHands
//
//  Created by Hadevs on 18/06/2019.
//  Copyright © 2019 Hadevs. All rights reserved.
//

import Foundation

class PasswordValidator {
	private let password: String
	init(_ password: String) {
		self.password = password
	}
	
	func validate() -> Bool {
		var isContainsUppercase = false
		var isContainsLowercase = false
		for character in password {
			if character.isUppercase {
				isContainsUppercase = true
			}
			if character.isLowercase {
				isContainsLowercase = true
			}
		}
		
		let containsDigits = password.rangeOfCharacter(from: .decimalDigits) != nil
		
		return password.count >= 6 && isContainsLowercase && isContainsUppercase && containsDigits
	}
}
