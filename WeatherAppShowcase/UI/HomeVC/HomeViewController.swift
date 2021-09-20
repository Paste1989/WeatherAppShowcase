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
    
    
    var currentWeather: WeatherModel!
    
    override func loadView() {
        view = homeView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        locationService.getCurrentLocation()
        addCallbacks()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isVisible(false)
        setupOptions()
        guard let settings = viewModel.getSettings() else { return }
        _ = self.homeView.updateMeasurementSymbol(celsiusON: settings.isCelsiusON)

        if currentWeather != nil {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                self.homeView.updateTemperatures(temp: self.currentWeather.temperature, minTemp: self.currentWeather.maxTemp, maxTemp: self.currentWeather.minTemp, isCelsius: settings.isCelsiusON)
            }
        }
    }
    
    private func addCallbacks() {
        homeView.onSearchButtonTapped = { [weak self] in
            self?.viewModel.onSearchTapped?()
        }
        homeView.onSettingsButtonTapped = { [weak self] in
            self?.viewModel.onSettingsTapped?()
        }
        
        dataService.onWeatherUpdateSuccess = { [weak self] weather in
            guard let settings = self?.viewModel.getSettings() else { return }
            self?.homeView.updateWeatherData(weather: weather, settings: settings)
            self?.currentWeather = weather
        }
        dataService.onWeatherUpdateFailure = { [weak self] error in
            let alert = UIAlertController(title: "Error occurred", message: "\(error)", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
            self?.present(alert, animated: true, completion: nil)
        }
        
        locationService.onCoordinatesFetch = { [weak self] lat, lon in
            self?.dataService.fetchWeatherDataForLocation(latitude: lat, longitude: lon)
        }
        
        viewModel.onWeatherSearched = { [weak self] name in
            self?.dataService.fetchWeatherDataForCity(with: name)
        }
        
        viewModel.onSettingsStored = { [weak self] settings in
           _ = self?.homeView.updateMeasurementSymbol(celsiusON: settings.isCelsiusON)
        }
    }
    
    private func setupOptions() {
        guard let settings = viewModel.getSettings() else { return }
        homeView.showDetails(humidity: !settings.isHumidityON, presssure: !settings.isPressureON, wind: !settings.isWindON)
    }
}

//extension HomeViewController: DataServiceProtocol {
//    func didUpdateData(_ weatherManager: DataService, weather: WeatherModel) {
//        homeView.updateWeatherData(weather: weather)
//    }
//
//    func didFailWithError(error: Error) {
//        print("Error: \(error)")
//    }
//
//
//}
