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
    
    let wmanager = DataService()
    
    override func loadView() {
        view = homeView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        wmanager.delegate = self
        addCallbacks()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = true
        let settings = viewModel.getSettings()
        homeView.showDetails(humidity: !settings.isHumidityON, presssure: !settings.isPressureON, wind: !settings.isWindON)
        
        
        wmanager.fetchData(with: "Osijek")
    }
    
    private func addCallbacks() {
        homeView.onSearchButtonTapped = { [weak self] in
            self?.viewModel.onSearchTapped?()
        }
        homeView.onSettingsButtonTapped = { [weak self] in
            self?.viewModel.onSettingsTapped?()
        }
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
