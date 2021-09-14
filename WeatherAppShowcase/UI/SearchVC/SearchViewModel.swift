//
//  SearchViewModel.swift
//  WeatherAppShowcase
//
//  Created by cobe on 03.09.2021..
//

import Foundation

class SearchViewModel {
    let dataService: DataService
    let settingsPersistanceService: SettingsRepositoryProtocol
    init(dataService: DataService, settingsPersistanceService: SettingsRepositoryProtocol) {
        self.dataService = dataService
        self.settingsPersistanceService = settingsPersistanceService
    }
    
}
