//
//  RootCoordinator.swift
//  WeatherAppShowcase
//
//  Created by cobe on 02.09.2021..
//

import Foundation
import UIKit

class RootCoordinator: Coordinator {
    let navigationController = UINavigationController()
    var childCoordinator: Coordinator?
    
    func start() -> UIViewController {
        let vc = setHomeVCasRoot()
        
        return vc
    }
    
    private func setHomeVCasRoot() -> UIViewController {
        let homeCoordinator = HomeCoordinator(navController: navigationController)
        childCoordinator = homeCoordinator
        let rootVC = homeCoordinator.start()
        rootVC.showAsRoot()
        
        return rootVC
    }
    
    
}
