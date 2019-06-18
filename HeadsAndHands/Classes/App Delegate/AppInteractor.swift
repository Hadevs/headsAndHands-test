//
//  AppInteractor.swift
//  HeadsAndHands
//
//  Created by Hadevs on 18/06/2019.
//  Copyright © 2019 Hadevs. All rights reserved.
//

import UIKit

class AppInteractor {
	private weak var appDelegate: AppDelegate?
	private let startRouter = StartRouter()
	init(appDelegate: AppDelegate) {
		self.appDelegate = appDelegate
	}

	func root(with window: inout UIWindow?) {
		let rootViewController = StartViewController()
		rootViewController.router = startRouter
		startRouter.root(&window, rootViewController: UINavigationController.init(rootViewController: rootViewController))
	}
}
