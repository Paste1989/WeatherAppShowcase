//
//  DataService.swift
//  WeatherAppShowcase
//
//  Created by cobe on 06.09.2021..
//

import Foundation
import CoreLocation

protocol DataServiceProtocol {
    func didUpdateData(_ weatherManager: DataService, weather: WeatherModel)
    func didFailWithError(error: Error)
}

class DataService  {
    let baseURL = "https://api.openweathermap.org/data/2.5/weather?appid=4dc5e730ec9e6a9cc99b8ebebfab801a&units=metric"
    
    var delegate: DataServiceProtocol?
    
    func fetchData(with cityName: String) {
        let urlString = "\(baseURL)&q=\(cityName)"
        performRequest(with: urlString)
    }
    
    func fetchWeather(latitude: CLLocationDegrees, longitude: CLLocationDegrees) {
        let urlString = "\(baseURL)&lat=\(latitude)&lon=\(longitude)"
        performRequest(with: urlString)
    }
    
    func performRequest(with urlString: String) {
        if let url = URL(string: urlString) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    self.delegate?.didFailWithError(error: error!)
                    return
                }
                if let safeData = data {
                    if let weather = self.parseJSON(safeData) {
                        self.delegate?.didUpdateData(self, weather: weather)
                    }
                }
            }
            task.resume()
        }
    }
    
    func parseJSON(_ weatherData: Data) -> WeatherModel? {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(WeatherData.self, from: weatherData)
            print(decodedData.weather)
            let id = decodedData.weather[0].id
            let name = decodedData.name
            let temp = decodedData.main.temp
            let minTemp = decodedData.main.temp_min
            let maxTemp = decodedData.main.temp_max
            let humidity = decodedData.main.humidity
            let pressure = decodedData.main.pressure
            let windSpeed = decodedData.wind.speed
            
            let weatherData = WeatherModel(conditionId: id, cityName: name, temperature: temp, minTemp: minTemp, maxTemp: maxTemp, humidity: humidity, pressure: pressure, wind: Int(windSpeed))
            
            
            print("OSIJEK: \(weatherData.cityName)")
            print("OSIJEK_temp: \(weatherData.temperatureString)")
            print("OSIJEK_id: \(weatherData.conditionId)")
            
            return weatherData
            
        } catch {
            delegate?.didFailWithError(error: error)
            print(error)
            return nil
        }
    }
}
