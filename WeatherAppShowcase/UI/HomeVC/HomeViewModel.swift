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
    let settingsPersistanceService: PersistanceRepositoryProtocol
    let locationService: LocationService
    init(dataService: DataService, settingsPersistanceService: PersistanceRepositoryProtocol, locationService: LocationService) {
        self.dataService = dataService
        self.settingsPersistanceService = settingsPersistanceService
        self.locationService = locationService
    }
    
    var onSearchTapped: (()->Void)?
    var onSettingsTapped:(()->Void)?
    var onWeatherSearched: ((String)->Void)?
    
    
    func getSettings() -> Settings? {
        return ServiceFactory.settingsPersistenceService.getSettings(with: SavingKeys.settingsKey.rawValue)
    }
}
