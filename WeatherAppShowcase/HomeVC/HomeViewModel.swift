//
//  HomeViewModel.swift
//  WeatherAppShowcase
//
//  Created by cobe on 03.09.2021..
//

import Foundation
import UIKit

class HomeViewModel {
    let settingsPersistanceService: SettingsRepositoryProtocol
    init(settingsPersistanceService: SettingsRepositoryProtocol) {
        self.settingsPersistanceService = settingsPersistanceService
    }
    
    var onSearchTapped: (()->Void)?
    var onSettingsTapped:(()->Void)?
    
//    func showTempDetails(settings: Settings) {
//        if settings.isCelsiusON {
//
//        }
//        else if settings.isFahreheitON {
//
//        }
//        else if settings.isHumidityON {
//
//        }
//        else if settings.isPressureON {
//
//        }
//        else if settings.isWindON {
//
//        }
//    }
    func getSettings() -> Settings {
        return ServiceFactory.settingsPersistenceService.getSettings()
    }
}
