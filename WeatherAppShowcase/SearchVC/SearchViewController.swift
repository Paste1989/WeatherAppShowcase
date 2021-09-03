//
//  SearchViewController.swift
//  WeatherAppShowcase
//
//  Created by cobe on 03.09.2021..
//

import UIKit

class SearchViewController: UIViewController {
    private lazy var searchView = SearchView()
    
    override func loadView() {
        view = searchView
    }

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
}
