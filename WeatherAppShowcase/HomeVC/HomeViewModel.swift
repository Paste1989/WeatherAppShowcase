//
//  HomeViewModel.swift
//  WeatherAppShowcase
//
//  Created by cobe on 03.09.2021..
//

import Foundation
import UIKit

class HomeViewModel {
    let dataService: DataService
    let settingsPersistanceService: SettingsRepositoryProtocol
    init(dataService: DataService, settingsPersistanceService: SettingsRepositoryProtocol) {
        self.dataService = dataService
        self.settingsPersistanceService = settingsPersistanceService
    }
    
    var onSearchTapped: (()->Void)?
    var onSettingsTapped:(()->Void)?
    
    
    func getSettings() -> Settings {
        return ServiceFactory.settingsPersistenceService.getSettings()
    }
}
