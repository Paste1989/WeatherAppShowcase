//
//  SearchViewController.swift
//  WeatherAppShowcase
//
//  Created by cobe on 03.09.2021..
//

import UIKit

class SearchViewController: UIViewController {
    private lazy var searchView = SearchView()
    var viewModel: SearchViewModel!

    var locations = [String]()
    
    override func loadView() {
        view = searchView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        addCallbacks()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isVisible(false)
        
        self.searchView.locations = viewModel.persistanceService.getLocations()
    }
    
    
    private func addCallbacks() {
        searchView.onSearchButtonTapped = { [weak self] name in
            self?.viewModel.onSearchButtonTapped?(name)
            self?.viewModel.saveLocations(location: name)
        }
        
        searchView.onLocationTapped = { [weak self] name in
            self?.viewModel.onSearchButtonTapped?(name)
        }
        
        searchView.onRemoveLocation = { [weak self] index in
            self?.viewModel.persistanceService.removeLocation(index: index)
        }
        
        viewModel.dataService.onWeatherUpdateFailure = { [weak self] index in
    
        }
    }
    
}
