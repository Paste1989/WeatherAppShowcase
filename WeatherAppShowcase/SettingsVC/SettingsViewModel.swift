//
//  SettingsViewModel.swift
//  WeatherAppShowcase
//
//  Created by cobe on 03.09.2021..
//

import Foundation
import UIKit

class SettingsViewModel {
    let settingsPersistanceService: SettingsRepositoryProtocol
    init(settingsPersistanceService: SettingsRepositoryProtocol) {
        self.settingsPersistanceService = settingsPersistanceService
    }
    
    var onViewWillApper: ((Settings)->Void)?
    var onViewWillDisappear: ((Settings)->Void)?
    
    func saveSettings(with settings: Settings) {
        settingsPersistanceService.saveSettings(settings)
    }
    
    func getSettings() -> Settings {
        return settingsPersistanceService.getSettings()
    }
    
//    var onCelsiusTapped: ((Bool)->Void)?
//    var onFahrenheitTapped: ((Bool)->Void)?
//    var onHumidityTapped: ((Bool)->Void)?
//    var onPressureTapped: ((Bool)->Void)?
//    var onWindTapped: ((Bool)->Void)?
    
}
