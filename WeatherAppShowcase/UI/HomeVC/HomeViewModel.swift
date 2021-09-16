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
    let persistanceService: PersistanceRepositoryProtocol
    let locationService: LocationService
    init(dataService: DataService, persistanceService: PersistanceRepositoryProtocol, locationService: LocationService) {
        self.dataService = dataService
        self.persistanceService = persistanceService
        self.locationService = locationService
    }
    
    var onSearchTapped: (()->Void)?
    var onSettingsTapped:(()->Void)?
    var onWeatherSearched: ((String)->Void)?
    
    
    func getSettings() -> Settings? {
        return ServiceFactory.settingsPersistenceService.getSettings(with: SavingKeys.settingsKey.rawValue)
    }
}
