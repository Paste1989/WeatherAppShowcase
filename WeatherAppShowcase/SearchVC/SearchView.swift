//
//  SearchView.swift
//  WeatherAppShowcase
//
//  Created by cobe on 03.09.2021..
//

import Foundation
import UIKit

class SearchView: UIView {
    private lazy var backgroundImageView = UIImageView()
    private lazy var searchTextField = UITextField()
    private lazy var searchButton = UIButton(type: .system)
    private lazy var locationTableView = UITableView()
    
    var onSearchButtonTapped: (()->Void)?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        locationTableView.delegate = self
        locationTableView.dataSource = self
        registerCell()
        setupView()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func registerCell() {
        locationTableView.register(UINib(nibName: "SearchTableViewCell", bundle: nil), forCellReuseIdentifier: "SearchTableViewCell")
    }
    
    private func setupView() {
        backgroundImageView.image = UIImage(named: "background")
        backgroundImageView.contentMode = .scaleAspectFill
        addSubview(backgroundImageView)
        
        searchTextField.backgroundColor = UIColor.white.withAlphaComponent(0.2)
        searchTextField.textColor = .white
        searchTextField.layer.cornerRadius = 10
        searchTextField.tintColor = .black
        searchTextField.placeholder = "Search"
        searchTextField.layer.sublayerTransform = CATransform3DMakeTranslation(10, 0, 0)
        backgroundImageView.addSubview(searchTextField)
        
        searchButton.setImage(UIImage(named: "search"), for: .normal)
        searchButton.addTarget(self, action: #selector(searchButtonTapped), for: .touchUpInside)
        backgroundImageView.addSubview(searchButton)
        
        locationTableView.backgroundColor = .clear
        locationTableView.separatorColor = .clear
        backgroundImageView.addSubview(locationTableView)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.useAndActivateConstraints(constraints: [
            backgroundImageView.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            backgroundImageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0),
            backgroundImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            backgroundImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            
            searchTextField.topAnchor.constraint(equalTo: backgroundImageView.topAnchor, constant: 100),
            searchTextField.leadingAnchor.constraint(equalTo: backgroundImageView.leadingAnchor, constant: 25),
            searchTextField.trailingAnchor.constraint(equalTo: searchButton.leadingAnchor, constant: -30),
            searchTextField.heightAnchor.constraint(equalToConstant: 50),
            
            searchButton.topAnchor.constraint(equalTo: backgroundImageView.topAnchor, constant: 100),
            searchButton.trailingAnchor.constraint(equalTo: backgroundImageView.trailingAnchor, constant: -25),
            searchButton.heightAnchor.constraint(equalToConstant: 50),
            searchButton.widthAnchor.constraint(equalToConstant: 50),
            
            locationTableView.topAnchor.constraint(equalTo: searchTextField.bottomAnchor, constant: 25),
            locationTableView.bottomAnchor.constraint(equalTo: backgroundImageView.bottomAnchor, constant: 50),
            locationTableView.leadingAnchor.constraint(equalTo: backgroundImageView.leadingAnchor, constant: 25),
            locationTableView.trailingAnchor.constraint(equalTo: backgroundImageView.trailingAnchor, constant: -25),
            
        ])
    }
    
    @objc func searchButtonTapped() {
        print("search tapped")
        onSearchButtonTapped?()
    }
}

extension SearchView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SearchTableViewCell", for: indexPath) as! SearchTableViewCell
        
        cell.setupView(name: "London")
         
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
}
