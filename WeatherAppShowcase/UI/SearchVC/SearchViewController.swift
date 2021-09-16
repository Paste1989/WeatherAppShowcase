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
        
        self.searchView.locations = viewModel.settingsPersistanceService.getLocations()
    }
    
    private func setupNavigationBar() {
        DispatchQueue.main.async {  
            let backButton = UIBarButtonItem()
            backButton.title = ""
            backButton.image = UIImage(named: "back")
            backButton.tintColor = .black
            self.navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
        }
    }
    
    private func addCallbacks() {
        searchView.onSearchButtonTapped = { [weak self] name in
            self?.viewModel.onSearchButtonTapped?(name)
            self?.viewModel.saveLocations(location: name)
        }
        
        searchView.onLocationTapped = { [weak self] name in
            self?.viewModel.onSearchButtonTapped?(name)
        }
        
        
    }
    
}
