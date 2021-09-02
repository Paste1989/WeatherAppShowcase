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
        let homeCoordinator = HomeCoordinator(navController: navigationController)
        let vc = homeCoordinator.start()
        
        return vc
    }
}

