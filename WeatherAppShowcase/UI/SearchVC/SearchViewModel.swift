//
//  SearchViewModel.swift
//  WeatherAppShowcase
//
//  Created by cobe on 03.09.2021..
//

import Foundation

class SearchViewModel {
    let dataService: DataService
    let settingsPersistanceService: PersistanceRepositoryProtocol
    init(dataService: DataService, settingsPersistanceService: PersistanceRepositoryProtocol) {
        self.dataService = dataService
        self.settingsPersistanceService = settingsPersistanceService
    }
    var onSearchButtonTapped: ((String)->Void)?
    
    func saveLocations(location: String) {
        settingsPersistanceService.saveLocations(location: location)
    }
    
    func getLocations() -> [String] {
        return settingsPersistanceService.getLocations()
    }
    
}
