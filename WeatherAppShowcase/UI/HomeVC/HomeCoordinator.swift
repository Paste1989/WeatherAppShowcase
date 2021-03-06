//
//  HomeCoordinator.swift
//  WeatherAppShowcase
//
//  Created by cobe on 02.09.2021..
//

import Foundation
import UIKit

class HomeCoordinator: Coordinator {
    let navigationController: UINavigationController
    init(navController: UINavigationController) {
        self.navigationController = navController
    }
    var onCityNameRecived: ((String)->Void)?
    var onSettingsSaved: ((Settings)->Void)?
    var onFahrenheit: (()->Void)?
    
    func start() -> UIViewController {
        let vc = createHomeVC()
        navigationController.pushViewController(vc, animated: true)
        
        return navigationController
    }
    
    private func createHomeVC() -> UIViewController {
        let vc = HomeViewController()
        vc.viewModel = HomeViewModel(dataService: ServiceFactory.dataService, persistanceService: ServiceFactory.settingsPersistenceService, locationService: ServiceFactory.locationService)
        
        vc.viewModel.onSearchTapped = { [weak self] in
            _ = self?.createSearchVC()
        }
        vc.viewModel.onSettingsTapped = { [weak self] in
            _ = self?.createSettingsVC()
        }
        
        onCityNameRecived = { [weak self] name in
            vc.viewModel.onWeatherSearched?(name)
        }
         
        onSettingsSaved = { [weak self] settings in
            vc.viewModel.onSettingsStored?(settings)
        }
        
        return vc
    }
    
    private func createSearchVC() -> UIViewController {
        let vc = SearchViewController()
        vc.viewModel = SearchViewModel(dataService: ServiceFactory.dataService, persistanceService: ServiceFactory.settingsPersistenceService)
        
        vc.viewModel.onSearchButtonTapped = { [weak self] name in
            vc.viewModel.dataService.fetchWeatherDataForCity(with: name)
            self?.onCityNameRecived?(name)
            self?.navigationController.popViewController(animated: true)
        }
        
        navigationController.pushViewController(vc, animated: true)
        return vc
    }
    
    private func createSettingsVC() -> UIViewController {
        let vc = SettingsViewController()
        vc.viewModel = SettingsViewModel(persistanceService: ServiceFactory.settingsPersistenceService)
        
        vc.viewModel.onViewWillDissapear = { [weak self] settings in
            self?.onSettingsSaved?(settings)
        }
    
        navigationController.pushViewController(vc, animated: true)
        return vc
    }
}

