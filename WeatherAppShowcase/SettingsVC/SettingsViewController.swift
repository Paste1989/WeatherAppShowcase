//
//  SettingsViewController.swift
//  WeatherAppShowcase
//
//  Created by cobe on 03.09.2021..
//

import UIKit

class SettingsViewController: UIViewController {
    private lazy var settingsView = SettingsView()
    var viewModel: SettingsViewModel!
    
    override func loadView() {
        view  = settingsView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        addCallbacks()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = false
    }
    
    private func addCallbacks() {
        settingsView.onCelsiusButtonTapped = { [weak self] tag in
            self?.settingsView.checkButtonTapped(buttonTag: tag)
        }
        settingsView.onFahrenheitButtonTapped = { [weak self] tag in
            self?.settingsView.checkButtonTapped(buttonTag: tag)
        }
        settingsView.onHumidityButtonTapped = { [weak self] tag in
            self?.settingsView.checkButtonTapped(buttonTag: tag)
        }
        settingsView.onPressureButtonTapped = { [weak self] tag in
            self?.settingsView.checkButtonTapped(buttonTag: tag)
        }
        settingsView.onWindButtonTapped = { [weak self] tag in
            self?.settingsView.checkButtonTapped(buttonTag: tag)
        }
        
        
    }
}
