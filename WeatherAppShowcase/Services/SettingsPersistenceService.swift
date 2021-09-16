//
//  SettingsPersistenceService.swift
//  WeatherAppShowcase
//
//  Created by cobe on 05.09.2021..
//

import Foundation

public enum SavingKeys: String {
    case settingsKey = "settingsKey"
    case searchedLocationsKey = "searchedLocationsKey"
}

protocol SettingsRepositoryProtocol {
    func saveSettings (_ settings: Settings, with key: String)
    func getSettings(with key:  String) -> Settings?
    func saveLocations(location: String)
    func getLocations() -> [String]
}

class SettingsPersistenceService: SettingsRepositoryProtocol {
    func saveSettings(_ settings: Settings, with key: String) {
        do {
            let encoder = JSONEncoder()
            let data = try encoder.encode(settings)
            UserDefaults.standard.set(data, forKey: key)
            UserDefaults.standard.synchronize()
        } catch {
            print("Unable to Encode Note (\(error))")
        }
    }
    
    func getSettings(with key: String) -> Settings? {
        var storedSettings: Settings!
        if let data = UserDefaults.standard.data(forKey: key) {
            do {
                let decoder = JSONDecoder()
                let decodedSettings = try decoder.decode(Settings.self, from: data)
                let settings = Settings(isCelsiusON: decodedSettings.isCelsiusON, isFahreheitON: decodedSettings.isFahreheitON, isHumidityON: decodedSettings.isHumidityON, isPressureON: decodedSettings.isPressureON, isWindON: decodedSettings.isWindON)
                
                storedSettings = settings
        
            } catch {
                print("Unable to Decode Note (\(error))")
            }
        }
        return storedSettings
    }
    
    
    func saveLocations(location: String) {
        var locations = UserDefaults.standard.object(forKey: SavingKeys.searchedLocationsKey.rawValue) as! [String]
        locations.append(location)
        UserDefaults.standard.set(locations, forKey: SavingKeys.searchedLocationsKey.rawValue)
        UserDefaults.standard.synchronize()
    }
    
    func getLocations() -> [String] {
        var locations = [String]()
        locations = UserDefaults.standard.object(forKey: SavingKeys.searchedLocationsKey.rawValue) as! [String]
        UserDefaults.standard.synchronize()
        
        return locations
    }
}
