//
//  StartRouter.swift
//  HeadsAndHands
//
//  Created by Hadevs on 18/06/2019.
//  Copyright © 2019 Hadevs. All rights reserved.
//

import UIKit

class StartRouter {
	func root(_ window: inout UIWindow?, rootViewController: UIViewController) {
		window = UIWindow(frame: UIScreen.main.bounds)
		window?.makeKeyAndVisible()
		window?.rootViewController = rootViewController
	}
	
	func goToAuthViewController(from source: UIViewController) {
		let authViewController = AuthViewController()
		source.show(authViewController, sender: source)
	}
}
