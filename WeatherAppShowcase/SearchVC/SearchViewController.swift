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
    
    override func loadView() {
        view = searchView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
       
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = false
    }
    
    private func setupNavigationBar() {
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
