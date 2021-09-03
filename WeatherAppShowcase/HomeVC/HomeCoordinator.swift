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
    
    func start() -> UIViewController {
        let vc = createHomeVC()
        navigationController.pushViewController(vc, animated: true)
        
        return navigationController
    }
    
    private func createHomeVC() -> UIViewController {
        let vc = HomeViewController()
        vc.viewModel = HomeViewModel()
        
        vc.viewModel.onSearchTapped = { [weak self] in
            _ = self?.createSearchVC()
        }
        vc.viewModel.onSettingsTapped = { [weak self] in
            _ = self?.createSettingsVC()
        }
        
        return vc
    }
    
    private func createSearchVC() -> UIViewController {
        let vc = SearchViewController()
        vc.viewModel = SearchViewModel()
        
        navigationController.pushViewController(vc, animated: true)
        return vc
    }
    
    private func createSettingsVC() -> UIViewController {
        let vc = SettingsViewController()
        vc.viewModel = SettingsViewModel()
    
        navigationController.pushViewController(vc, animated: true)
        return vc
    }
}

