//
//  WeatherResponse.swift
//  HeadsAndHands
//
//  Created by Hadevs on 18/06/2019.
//  Copyright © 2019 Hadevs. All rights reserved.
//

import Foundation

struct WeatherResponse: Codable {
	struct Coord: Codable {
		var lon: Double?
		var lat: Double?
	}
	
	var coord: Coord?
	struct Weather: Codable {
		var id: Int
		var main: String?
		var description: String?
		var icon: String?
	}
	
	struct Clouds: Codable {
		var all: Int?
	}
	
	struct Main: Codable {
		var temp: Double?
		var pressure: Int?
		var humidity: Double?
		var temp_min: Double?
		var temp_max: Double?
	}
	
	struct Wind: Codable {
		var speed: Double?
		var deg: Double?
	}
	
	var weather: [Weather] = []
	var base: String?

	var main: Main?
	var visibility: Int?

	var wind: Wind?
	
	var clouds: Clouds?
	var dt: Int?
}
