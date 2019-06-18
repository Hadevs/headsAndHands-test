//
//  WeatherNetworkServiceImplementation.swift
//  HeadsAndHands
//
//  Created by Hadevs on 18/06/2019.
//  Copyright © 2019 Hadevs. All rights reserved.
//

import Foundation
import Alamofire

class WeatherNetworkServiceImplementation: WeatherNetworkService {
	func fetchWeather(with completion: @escaping (Result<WeatherResponse>) -> Void) {
		let url = "https://samples.openweathermap.org/data/2.5/weather?q=London,uk&appid=b6907d289e10d714a6e88b30761fae22"
		Alamofire.request(url)
			.responseData { (response) in
				if let data = response.data {
					if let entity = try? JSONDecoder().decode(WeatherResponse.self, from: data) {
						completion(.success(entity))
					} else {
						completion(.error("С сервера пришли неверные данные."))
					}
				} else {
					completion(.error("Ошибка сервера."))
				}
		}
		
	}
}
