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
        settingsView.setupButtonView(celsiusON: getSettings?.isCelsiusON ?? true, fahrenheitON: getSettings?.isFahreheitON ?? false, humidityON: getSettings?.isHumidityON ?? true, pressureON: getSettings?.isPressureON ?? true, windON: getSettings?.isWindON ?? true)
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
        
        settingsView.onChangeSettingSave = { [weak self] in
            let settings = self?.settingsView.prepareForStoreSetttings()
            if let sett = settings {
                let saveSettings = Settings(isCelsiusON: sett.isCelsiusON, isFahreheitON: sett.isFahreheitON, isHumidityON: sett.isHumidityON, isPressureON: sett.isPressureON, isWindON: sett.isWindON)
                self?.viewModel.saveSettings(with: saveSettings)
            }
        }
        
    }
}
