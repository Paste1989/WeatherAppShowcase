//
//  SettingsPersistenceService.swift
//  WeatherAppShowcase
//
//  Created by cobe on 05.09.2021..
//

import Foundation

enum SavingKeys: String {
   case settingsKey = "settingsKey"
}

protocol SettingsRepositoryProtocol {
    func saveSettings (_ settings: Settings)
    func getSettings() -> Settings
}

class SettingsPersistenceService: SettingsRepositoryProtocol {
    func saveSettings(_ settings: Settings) {
        do {
            let encoder = JSONEncoder()
            let data = try encoder.encode(settings)
            UserDefaults.standard.set(data, forKey: SavingKeys.settingsKey.rawValue)
            UserDefaults.standard.synchronize()
        } catch {
            print("Unable to Encode Note (\(error))")
        }
    }
    
    func getSettings() -> Settings {
        var storedSettings: Settings!
        if let data = UserDefaults.standard.data(forKey: SavingKeys.settingsKey.rawValue) {
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
    
    
}
