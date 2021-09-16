//
//  SettingsViewModel.swift
//  WeatherAppShowcase
//
//  Created by cobe on 03.09.2021..
//

import Foundation
import UIKit

class SettingsViewModel {
    let persistanceService: PersistanceRepositoryProtocol
    init(persistanceService: PersistanceRepositoryProtocol) {
        self.persistanceService = persistanceService
    }
    
    var onViewWillApper: ((Settings)->Void)?
    
    func saveSettings(with settings: Settings) {
        persistanceService.saveSettings(settings, with: SavingKeys.settingsKey.rawValue)
    }
    
    func getSettings() -> Settings? {
        return persistanceService.getSettings(with: SavingKeys.settingsKey.rawValue)
    }
    
}
