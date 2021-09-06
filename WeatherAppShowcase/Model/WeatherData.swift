//
//  WeatherData.swift
//  WeatherAppShowcase
//
//  Created by cobe on 06.09.2021..
//

import Foundation

struct WeatherData: Codable {
    let name: String
    let weather: [Weather]
    let main: Main
    let wind: Wind
    
    struct Weather: Codable {
        let id: Int
        let description: String
    }
    
    struct Main: Codable {
        let temp: Double
        let temp_min: Double
        let temp_max: Double
        let humidity: Int
        let pressure: Int
    }
    
    struct Wind: Codable {
        let speed: Double
    }
}

struct WeatherModel {
    let conditionId: Int
    let cityName: String
    let temperature: Double
    let minTemp: Double
    let maxTemp: Double
    let humidity: Int
    let pressure: Int
    let wind: Int
    
    var temperatureString: String {
        return String(format: "%.1f", temperature)
    }
    
    var conditionName: String {
        switch conditionId {
        case 200...232:
            return "cloud.bolt"
        case 300...321:
            return "cloud.drizzle"
        case 500...531:
            return "cloud.rain"
        case 600...622:
            return "cloud.snow"
        case 701...781:
            return "cloud.fog"
        case 800:
            return "sun.max"
        case 801...804:
            return "cloud.bolt"
        default:
            return "cloud"
        }
    }
    
}

