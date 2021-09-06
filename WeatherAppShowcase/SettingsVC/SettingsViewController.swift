//
//  SettingsViewController.swift
//  WeatherAppShowcase
//
//  Created by cobe on 03.09.2021..
//

import UIKit

class SettingsViewController: UIViewController {
    lazy var settingsView = SettingsView()
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
        let getSettings = ServiceFactory.settingsPersistenceService.getSettings()
        settingsView.setupButtonView(celsiusON: getSettings.isCelsiusON, fahrenheitON: getSettings.isFahreheitON, humidityON: getSettings.isHumidityON, pressureON: getSettings.isPressureON, windON: getSettings.isWindON)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        let settings = settingsView.prepareForStoreSetttings()
        let saveSettings = Settings(isCelsiusON: settings.isCelsiusON, isFahreheitON: settings.isFahreheitON, isHumidityON: settings.isHumidityON, isPressureON: settings.isPressureON, isWindON: settings.isWindON)
        viewModel.saveSettings(with: saveSettings)
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
