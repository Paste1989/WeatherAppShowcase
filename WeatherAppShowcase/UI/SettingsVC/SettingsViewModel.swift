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
    
    func saveSettings(with settings: Settings) {
        settingsPersistanceService.saveSettings(settings, with: SavingKeys.settingsKey.rawValue)
    }
    
    func getSettings() -> Settings? {
        return settingsPersistanceService.getSettings(with: SavingKeys.settingsKey.rawValue)
    }
    
}
