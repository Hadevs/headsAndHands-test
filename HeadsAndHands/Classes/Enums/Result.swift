//
//  Result.swift
//  HeadsAndHands
//
//  Created by Hadevs on 18/06/2019.
//  Copyright © 2019 Hadevs. All rights reserved.
//

import Foundation

enum Result<T> {
	case success(T)
	case error(String)
}
