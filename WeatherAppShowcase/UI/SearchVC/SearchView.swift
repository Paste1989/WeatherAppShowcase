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
    lazy var locationTableView = UITableView()
    
    var onSearchButtonTapped: ((String)->Void)?
    var onLocationTapped: ((String)->Void)?
    var onRemoveLocation: ((Int)->Void)?
    
    var locations: [String]!
    
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
        self.clipsToBounds = true
        backgroundImageView.image = UIImage(named: "background")
        backgroundImageView.contentMode = .scaleAspectFill
        addSubview(backgroundImageView)

        searchTextField.backgroundColor = UIColor.white.withAlphaComponent(0.2)
        searchTextField.textColor = .white
        searchTextField.layer.cornerRadius = 10
        searchTextField.tintColor = .black
        searchTextField.placeholder = "Search"
        searchTextField.layer.sublayerTransform = CATransform3DMakeTranslation(10, 0, 0)
        addSubview(searchTextField)

        searchButton.setImage(UIImage(named: "search"), for: .normal)
        searchButton.addTarget(self, action: #selector(searchButtonTapped), for: .touchUpInside)
        addSubview(searchButton)
        
        locationTableView.backgroundColor = .clear
        locationTableView.separatorColor = .clear
        locationTableView.showsVerticalScrollIndicator = false
        addSubview(locationTableView)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.useAndActivateConstraints(constraints: [
            backgroundImageView.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            backgroundImageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0),
            backgroundImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            backgroundImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),

            searchTextField.topAnchor.constraint(equalTo: topAnchor, constant: 100),
            searchTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 25),
            searchTextField.widthAnchor.constraint(equalToConstant: 250),
            searchTextField.heightAnchor.constraint(equalToConstant: 50),

            searchButton.topAnchor.constraint(equalTo: topAnchor, constant: 100),
            searchButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -25),
            searchButton.heightAnchor.constraint(equalToConstant: 50),
            searchButton.widthAnchor.constraint(equalToConstant: 50),
            
            locationTableView.topAnchor.constraint(equalTo: searchTextField.bottomAnchor, constant: 25),
            locationTableView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -50),
            locationTableView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 25),
            locationTableView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -25),
            
        ])
    }
    
    @objc func searchButtonTapped() {
        print("search tapped")
        if let cityName = searchTextField.text {
            onSearchButtonTapped?(cityName)
        }
    }
}

extension SearchView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return locations.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SearchTableViewCell", for: indexPath) as! SearchTableViewCell
        
        cell.setupView(name: locations[indexPath.row])
         
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let location = locations[indexPath.row]
        onLocationTapped?(location)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCell.EditingStyle.delete {
            locations.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.automatic)
            tableView.reloadData()
            onRemoveLocation?(indexPath.row)
        }
    }
    
}
