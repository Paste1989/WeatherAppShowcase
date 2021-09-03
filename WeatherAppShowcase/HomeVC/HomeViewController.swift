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
    
    override func loadView() {
        view = homeView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        addCallbacks()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = true
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
