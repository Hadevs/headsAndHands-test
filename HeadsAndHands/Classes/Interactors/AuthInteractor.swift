//
//  AuthInteractor.swift
//  HeadsAndHands
//
//  Created by Hadevs on 18/06/2019.
//  Copyright © 2019 Hadevs. All rights reserved.
//

import Foundation

class AuthInteractor {
	private let networkService: WeatherNetworkService = WeatherNetworkServiceImplementation()
	
	func fetchWeather(with completion: @escaping (Result<WeatherResponse>) -> Void) {
			networkService.fetchWeather(with: completion)
	}
}
