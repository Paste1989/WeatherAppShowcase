//
//  HomeViewController.swift
//  WeatherAppShowcase
//
//  Created by cobe on 02.09.2021..
//

import UIKit

class HomeViewController: UIViewController {
    private lazy var homeView = HomeView()
    var viewModel: HomeViewModel!
    
    let dataService = DataService()
    let locationService = LocationService()
    
    override func loadView() {
        view = homeView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        dataService.delegate = self
        addCallbacks()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isVisible(false)
        locationService.getCurrentLocationURL()
        setupOptions()
    }
    
    private func addCallbacks() {
        homeView.onSearchButtonTapped = { [weak self] in
            self?.viewModel.onSearchTapped?()
        }
        homeView.onSettingsButtonTapped = { [weak self] in
            self?.viewModel.onSettingsTapped?()
        }
        
        locationService.onCoordinatesFetch = { [weak self] lat, lon in
            self?.dataService.fetchWeatherDataForLocation(latitude: lat, longitude: lon)
        }
    }
    
    private func setupOptions() {
        guard let settings = viewModel.getSettings() else { return }
        homeView.showDetails(humidity: !settings.isHumidityON, presssure: !settings.isPressureON, wind: !settings.isWindON)
    }
}

extension HomeViewController: DataServiceProtocol {
    func didUpdateData(_ weatherManager: DataService, weather: WeatherModel) {
        homeView.updateWeatherData(weather: weather)
    }
    
    func didFailWithError(error: Error) {
        print("Error: \(error)")
    }
    
    
}
