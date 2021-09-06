//
//  WeatherData.swift
//  WeatherAppShowcase
//
//  Created by cobe on 06.09.2021..
//

import Foundation

struct WeatherData: Codable {
    let name: String
    let weather: Weather
    let main: Main
    let wind: Wind
}

struct Weather: Codable {
    let id: Int
    let description: String
}

struct Main: Codable {
    let temp: Double
    let temp_min: Double
    let temp_max: Double
    let humidity: Int
    let pressuure: Int
}

struct Wind: Codable {
    let speed: Double
}


