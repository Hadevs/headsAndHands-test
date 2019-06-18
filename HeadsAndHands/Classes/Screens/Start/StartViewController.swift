//
//  StartViewController.swift
//  HeadsAndHands
//
//  Created by Hadevs on 18/06/2019.
//  Copyright © 2019 Hadevs. All rights reserved.
//

import UIKit

class StartViewController: UIViewController {
	@IBOutlet weak var button: UIButton!
	
	var router: StartRouter?

	override func viewDidLoad() {
		super.viewDidLoad()
		navigationItem.title = ""
		button.titleLabel?.adjustsFontSizeToFitWidth = true
	}


	@IBAction func authButtonClicked() {
		router?.goToAuthViewController(from: self)
	}
}
