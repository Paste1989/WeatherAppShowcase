//
//  NavigationBarExtension.swift
//  WeatherAppShowcase
//
//  Created by cobe on 03.09.2021..
//

import Foundation
import UIKit

extension UINavigationController {
    func setupNavigationBar() {
        self.navigationController?.navigationBar.isHidden = false
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
    }
    
    func setupBackButton() {
        let backButton = UIBarButtonItem()
        backButton.title = ""
        backButton.image = UIImage(named: "back")
        backButton.tintColor = .black
        self.navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
    }
    
    //
    func setupNavigationBar1() {
        DispatchQueue.main.async {
            self.navigationController?.navigationBar.isHidden = false
            self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
            self.navigationController?.navigationBar.shadowImage = UIImage()
            self.navigationController?.navigationBar.isTranslucent = true
            
            let backButton = UIBarButtonItem()
            backButton.title = ""
            backButton.image = UIImage(named: "back")
            backButton.tintColor = .black
            self.navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
        }
    }
}
