//
//  RootCoordinator.swift
//  WeatherAppShowcase
//
//  Created by cobe on 02.09.2021..
//

import Foundation
import UIKit

class RootCoordinator: Coordinator {
    func start() -> UIViewController {
        let vc = setHomeVCasRoot()
        
        return vc
    }
    
    
    private func setHomeVCasRoot() -> UIViewController {
        let vc = HomeViewController()
        vc.showAsRoot()
        
        return vc
    }
    
    
}
