//
//  ServiceFactory.swift
//  WeatherAppShowcase
//
//  Created by cobe on 05.09.2021..
//

import Foundation

final class ServiceFactory {
    static var settingsPersistenceService: SettingsPersistenceService = {
        return SettingsPersistenceService()
    }()
}
