//
//  ServiceFactory.swift
//  WeatherAppShowcase
//
//  Created by cobe on 05.09.2021..
//

import Foundation

final class ServiceFactory {
    static var settingsPersistenceService: PersistenceService = {
        return PersistenceService()
    }()
    
    static var dataService: DataService = {
        return DataService()
    }()
    
    static var locationService: LocationService = {
        return LocationService()
    }()
}
