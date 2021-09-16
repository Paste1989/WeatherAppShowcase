//
//  SearchViewModel.swift
//  WeatherAppShowcase
//
//  Created by cobe on 03.09.2021..
//

import Foundation

class SearchViewModel {
    let dataService: DataService
    let persistanceService: PersistanceRepositoryProtocol
    init(dataService: DataService, persistanceService: PersistanceRepositoryProtocol) {
        self.dataService = dataService
        self.persistanceService = persistanceService
    }
    var onSearchButtonTapped: ((String)->Void)?
    
    func saveLocations(location: String) {
        persistanceService.saveLocations(location: location)
    }
    
    func getLocations() -> [String] {
        return persistanceService.getLocations()
    }
    
}
