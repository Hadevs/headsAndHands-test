//
//  RectButton.swift
//  HeadsAndHands
//
//  Created by Hadevs on 18/06/2019.
//  Copyright © 2019 Hadevs. All rights reserved.
//

import UIKit

class RectButton: UIButton {
	override func didMoveToSuperview() {
		super.didMoveToSuperview()
		backgroundColor = .white
		layer.borderColor = Color.veryLightPink.cgColor
		layer.borderWidth = 0.5
		layer.cornerRadius = 4
		titleLabel?.font = UIFont.systemFont(ofSize: 12)
		setTitleColor(Color.brownGrey, for: .normal)
	}
}

