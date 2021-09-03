//
//  HomeView.swift
//  WeatherAppShowcase
//
//  Created by cobe on 02.09.2021..
//

import Foundation
import UIKit

class HomeView: UIView {
    private lazy var backgroundImageView = UIImageView()
    private lazy var topView = UIView()
    private lazy var searchButton = UIButton(type: .system)
    private lazy var settingsButton = UIButton(type: .system)
    private lazy var weatherImageView = UIImageView()
    
    private lazy var mainInfoView = UIView()
    private lazy var currentTemperatureLabel = UILabel()
    private lazy var locationLabel = UILabel()
    
    private lazy var tempStackView = UIStackView()
    private lazy var minTempStackView = UIStackView()
    private lazy var maxTempStackView = UIStackView()
    private lazy var minTempDescriptionLabel = UILabel()
    private lazy var maxTempDescriptionLabel = UILabel()
    private lazy var minTempLabel = UILabel()
    private lazy var maxTempLabel = UILabel()
    
    private lazy var detailsStackView = UIStackView()
    private lazy var humidityStackView = UIStackView()
    private lazy var pressureStackView = UIStackView()
    private lazy var windStackView = UIStackView()
    private lazy var humidityDescriptionLabel = UILabel()
    private lazy var pressureDescriptionLabel = UILabel()
    private lazy var windDescriptionLabel = UILabel()
    private lazy var humidityLabel = UILabel()
    private lazy var pressureLabel = UILabel()
    private lazy var windLabel = UILabel()
    
    var onSearchButtonTapped: (()->Void)?
    var onSettingsButtonTapped: (()->Void)?
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        backgroundImageView.image = UIImage(named: "background")
        backgroundImageView.contentMode = .scaleAspectFill
        addSubview(backgroundImageView)
        
        topView.backgroundColor = .clear
        backgroundImageView.addSubview(topView)
        
        searchButton.setImage(UIImage(named: "search"), for: .normal)
        searchButton.addTarget(self, action: #selector(searchButtonTapped), for: .touchUpInside)
        topView.addSubview(searchButton)
        
        settingsButton.setImage(UIImage(named: "settings"), for: .normal)
        settingsButton.addTarget(self, action: #selector(settingsButtonTapped), for: .touchUpInside)
        topView.addSubview(settingsButton)
        
        weatherImageView.image = UIImage(systemName: "sun.max")?.withRenderingMode(.alwaysTemplate)
        weatherImageView.tintColor = UIColor.black
        topView.addSubview(weatherImageView)
        
        mainInfoView.backgroundColor = .clear
        backgroundImageView.addSubview(mainInfoView)
        
        currentTemperatureLabel.text = "21°C"
        currentTemperatureLabel.font = UIFont.boldSystemFont(ofSize: 75)
        currentTemperatureLabel.contentMode = .right
        currentTemperatureLabel.adjustsFontSizeToFitWidth = true
        mainInfoView.addSubview(currentTemperatureLabel)
        
        locationLabel.text = "London"
        locationLabel.font = UIFont.systemFont(ofSize: 30)
        locationLabel.contentMode = .right
        locationLabel.adjustsFontSizeToFitWidth = true
        mainInfoView.addSubview(locationLabel)
        
        tempStackView.backgroundColor = .clear
        tempStackView.axis = .horizontal
        tempStackView.distribution  = .fillEqually
        tempStackView.spacing = 30
        backgroundImageView.addSubview(tempStackView)
        
        minTempStackView.backgroundColor = .clear
        minTempStackView.axis = .vertical
        minTempStackView.distribution  = .fillEqually
        minTempStackView.spacing = 10
        tempStackView.addSubview(minTempStackView)
        
        maxTempStackView.backgroundColor = .clear
        maxTempStackView.axis = .vertical
        maxTempStackView.distribution  = .fillEqually
        maxTempStackView.spacing = 10
        tempStackView.addSubview(maxTempStackView)
        
        minTempDescriptionLabel.text = "min"
        minTempDescriptionLabel.contentMode = .center
        minTempDescriptionLabel.font = UIFont.systemFont(ofSize: 30)
        minTempStackView.addSubview(minTempDescriptionLabel)
        
        maxTempDescriptionLabel.text = "max"
        maxTempDescriptionLabel.contentMode = .center
        maxTempDescriptionLabel.font = UIFont.systemFont(ofSize: 30)
        maxTempStackView.addSubview(maxTempDescriptionLabel)
        
        minTempLabel.text = "14.5°C"
        minTempLabel.contentMode = .center
        minTempLabel.font = UIFont.systemFont(ofSize: 30)
        minTempStackView.addSubview(minTempLabel)
        
        maxTempLabel.text = "31.2°C"
        maxTempLabel.contentMode = .center
        maxTempLabel.font = UIFont.systemFont(ofSize: 30)
        maxTempStackView.addSubview(maxTempLabel)
        
        detailsStackView.backgroundColor = .clear
        detailsStackView.axis = .horizontal
        detailsStackView.distribution  = .fillEqually
        detailsStackView.spacing = 30
        backgroundImageView.addSubview(detailsStackView)
        
        humidityStackView.backgroundColor = .clear
        humidityStackView.axis = .vertical
        humidityStackView.distribution  = .fillEqually
        humidityStackView.spacing = 10
        detailsStackView.addSubview(humidityStackView)
        
        pressureStackView.backgroundColor = .clear
        pressureStackView.axis = .vertical
        pressureStackView.distribution  = .fillEqually
        pressureStackView.spacing = 10
        detailsStackView.addSubview(pressureStackView)
        
        windStackView.backgroundColor = .clear
        windStackView.axis = .vertical
        windStackView.distribution  = .fillEqually
        windStackView.spacing = 10
        detailsStackView.addSubview(windStackView)
        
        humidityDescriptionLabel.text = "Humidity"
        humidityDescriptionLabel.contentMode = .center
        humidityDescriptionLabel.font = UIFont.systemFont(ofSize: 20)
        humidityDescriptionLabel.textColor = .white
        humidityStackView.addSubview(humidityDescriptionLabel)
        
        pressureDescriptionLabel.text = "Pressure"
        pressureDescriptionLabel.contentMode = .center
        pressureDescriptionLabel.font = UIFont.systemFont(ofSize: 20)
        pressureDescriptionLabel.textColor = .white
        pressureStackView.addSubview(pressureDescriptionLabel)
        
        windDescriptionLabel.text = "Wind"
        windDescriptionLabel.contentMode = .center
        windDescriptionLabel.font = UIFont.systemFont(ofSize: 20)
        windDescriptionLabel.textColor = .white
        windStackView.addSubview(windDescriptionLabel)
        
        humidityLabel.text = "0.79 %"
        humidityLabel.contentMode = .center
        humidityLabel.font = UIFont.systemFont(ofSize: 20)
        humidityLabel.textColor = .white
        humidityStackView.addSubview(humidityLabel)
        
        pressureLabel.text = "1016.7 hpa"
        pressureLabel.contentMode = .center
        pressureLabel.font = UIFont.systemFont(ofSize: 20)
        pressureLabel.textColor = .white
        pressureStackView.addSubview(pressureLabel)
        
        windLabel.text = "4.34 mph"
        windLabel.contentMode = .center
        windLabel.font = UIFont.systemFont(ofSize: 20)
        windLabel.textColor = .white
        windStackView.addSubview(windLabel)

    }
    
    private func setupConstraints() {
        NSLayoutConstraint.useAndActivateConstraints(constraints: [
            backgroundImageView.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            backgroundImageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0),
            backgroundImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            backgroundImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            
            topView.topAnchor.constraint(equalTo: backgroundImageView.topAnchor, constant: 75),
            topView.leadingAnchor.constraint(equalTo: backgroundImageView.leadingAnchor, constant: 25),
            topView.trailingAnchor.constraint(equalTo: backgroundImageView.trailingAnchor, constant: -25),
            topView.heightAnchor.constraint(equalToConstant: 100),
            
            searchButton.heightAnchor.constraint(equalToConstant: 40),
            searchButton.widthAnchor.constraint(equalToConstant: 40),
            searchButton.leadingAnchor.constraint(equalTo: topView.leadingAnchor, constant: 20),
            searchButton.centerYAnchor.constraint(equalTo: topView.centerYAnchor, constant: 0),
            
            settingsButton.heightAnchor.constraint(equalToConstant: 40),
            settingsButton.widthAnchor.constraint(equalToConstant: 40),
            settingsButton.leadingAnchor.constraint(equalTo: searchButton.trailingAnchor, constant: 20),
            settingsButton.centerYAnchor.constraint(equalTo: topView.centerYAnchor, constant: 0),
            
            weatherImageView.heightAnchor.constraint(equalToConstant: 110),
            weatherImageView.widthAnchor.constraint(equalToConstant: 110),
            weatherImageView.trailingAnchor.constraint(equalTo: topView.trailingAnchor, constant: 0),
            weatherImageView.centerYAnchor.constraint(equalTo: topView.centerYAnchor, constant: 0),
            
            mainInfoView.topAnchor.constraint(equalTo: topView.bottomAnchor, constant: 20),
            mainInfoView.trailingAnchor.constraint(equalTo: backgroundImageView.trailingAnchor, constant: 0),
            mainInfoView.heightAnchor.constraint(equalToConstant: 150),
            mainInfoView.widthAnchor.constraint(equalToConstant: 200),
            
            currentTemperatureLabel.heightAnchor.constraint(equalToConstant: 100),
            currentTemperatureLabel.widthAnchor.constraint(equalToConstant: 200),
            currentTemperatureLabel.topAnchor.constraint(equalTo: mainInfoView.topAnchor, constant: 10),
            currentTemperatureLabel.trailingAnchor.constraint(equalTo: mainInfoView.trailingAnchor, constant: 0),
            
            locationLabel.topAnchor.constraint(equalTo: currentTemperatureLabel.bottomAnchor, constant: 0),
            locationLabel.trailingAnchor.constraint(equalTo: mainInfoView.trailingAnchor, constant: 0),
            locationLabel.heightAnchor.constraint(equalToConstant: 30),
            locationLabel.widthAnchor.constraint(equalToConstant: 150),
            
            tempStackView.topAnchor.constraint(equalTo: mainInfoView.bottomAnchor, constant: 50),
            tempStackView.leadingAnchor.constraint(equalTo: backgroundImageView.leadingAnchor, constant: 25),
            tempStackView.trailingAnchor.constraint(equalTo: backgroundImageView.trailingAnchor, constant: -25),
            tempStackView.heightAnchor.constraint(equalToConstant: 100),
            
            minTempStackView.topAnchor.constraint(equalTo: tempStackView.topAnchor, constant: 10),
            minTempStackView.leadingAnchor.constraint(equalTo: tempStackView.leadingAnchor, constant: 10),
            minTempStackView.heightAnchor.constraint(equalToConstant: 80),
            minTempStackView.widthAnchor.constraint(equalToConstant: 150),
            
            maxTempStackView.topAnchor.constraint(equalTo: tempStackView.topAnchor, constant: 10),
            maxTempStackView.trailingAnchor.constraint(equalTo: tempStackView.trailingAnchor, constant: -10),
            maxTempStackView.heightAnchor.constraint(equalToConstant: 80),
            maxTempStackView.widthAnchor.constraint(equalToConstant: 150),
            
            minTempDescriptionLabel.centerXAnchor.constraint(equalTo: minTempStackView.centerXAnchor, constant: 0),
            minTempDescriptionLabel.centerYAnchor.constraint(equalTo: minTempStackView.centerYAnchor, constant: -20),
            minTempDescriptionLabel.heightAnchor.constraint(equalToConstant: 50),
            minTempDescriptionLabel.widthAnchor.constraint(equalToConstant: 65),
        
            maxTempDescriptionLabel.centerXAnchor.constraint(equalTo: maxTempStackView.centerXAnchor, constant: 0),
            maxTempDescriptionLabel.centerYAnchor.constraint(equalTo: maxTempStackView.centerYAnchor, constant: -20),
            maxTempDescriptionLabel.heightAnchor.constraint(equalToConstant: 50),
            maxTempDescriptionLabel.widthAnchor.constraint(equalToConstant: 65),
            
            minTempLabel.topAnchor.constraint(equalTo: minTempDescriptionLabel.bottomAnchor, constant: 0),
            minTempLabel.centerYAnchor.constraint(equalTo: minTempStackView.centerYAnchor, constant: 20),
            minTempLabel.centerXAnchor.constraint(equalTo: minTempStackView.centerXAnchor, constant: 0),
            minTempLabel.heightAnchor.constraint(equalToConstant: 50),
            
            maxTempLabel.topAnchor.constraint(equalTo: maxTempDescriptionLabel.bottomAnchor, constant: 0),
            maxTempLabel.centerYAnchor.constraint(equalTo: maxTempStackView.centerYAnchor, constant: 20),
            maxTempLabel.centerXAnchor.constraint(equalTo: maxTempStackView.centerXAnchor, constant: 0),
            maxTempLabel.heightAnchor.constraint(equalToConstant: 50),
            
            detailsStackView.bottomAnchor.constraint(equalTo: backgroundImageView.bottomAnchor, constant: -100),
            detailsStackView.leadingAnchor.constraint(equalTo: backgroundImageView.leadingAnchor, constant: 25),
            detailsStackView.trailingAnchor.constraint(equalTo: backgroundImageView.trailingAnchor, constant: -25),
            detailsStackView.heightAnchor.constraint(equalToConstant: 100),
            
            humidityStackView.topAnchor.constraint(equalTo: detailsStackView.topAnchor, constant: 10),
            humidityStackView.leadingAnchor.constraint(equalTo: detailsStackView.leadingAnchor, constant: 10),
            humidityStackView.heightAnchor.constraint(equalToConstant: 80),
            humidityStackView.widthAnchor.constraint(equalToConstant: 90),
            
            pressureStackView.topAnchor.constraint(equalTo: detailsStackView.topAnchor, constant: 10),
            pressureStackView.leadingAnchor.constraint(equalTo: humidityStackView.trailingAnchor, constant: 10),
            pressureStackView.trailingAnchor.constraint(equalTo: windStackView.leadingAnchor, constant: -10),
            pressureStackView.heightAnchor.constraint(equalToConstant: 80),
            
            windStackView.topAnchor.constraint(equalTo: detailsStackView.topAnchor, constant: 10),
            windStackView.trailingAnchor.constraint(equalTo: detailsStackView.trailingAnchor, constant: -10),
            windStackView.heightAnchor.constraint(equalToConstant: 80),
            windStackView.widthAnchor.constraint(equalToConstant: 90),
            
            humidityDescriptionLabel.topAnchor.constraint(equalTo: humidityStackView.topAnchor, constant: 0),
            humidityDescriptionLabel.centerYAnchor.constraint(equalTo: humidityStackView.centerYAnchor, constant: 20),
            humidityDescriptionLabel.centerXAnchor.constraint(equalTo: humidityStackView.centerXAnchor, constant: 0),
            humidityDescriptionLabel.heightAnchor.constraint(equalToConstant: 50),
            
            pressureDescriptionLabel.topAnchor.constraint(equalTo: pressureStackView.topAnchor, constant: 0),
            pressureDescriptionLabel.centerYAnchor.constraint(equalTo: pressureStackView.centerYAnchor, constant: 20),
            pressureDescriptionLabel.centerXAnchor.constraint(equalTo: pressureStackView.centerXAnchor, constant: 0),
            pressureDescriptionLabel.heightAnchor.constraint(equalToConstant: 50),
            
            windDescriptionLabel.topAnchor.constraint(equalTo: windStackView.topAnchor, constant: 0),
            windDescriptionLabel.centerYAnchor.constraint(equalTo: windStackView.centerYAnchor, constant: 20),
            windDescriptionLabel.centerXAnchor.constraint(equalTo: windStackView.centerXAnchor, constant: 0),
            windDescriptionLabel.heightAnchor.constraint(equalToConstant: 50),
            
            humidityLabel.topAnchor.constraint(equalTo: humidityDescriptionLabel.bottomAnchor, constant: 0),
            humidityLabel.centerYAnchor.constraint(equalTo: humidityStackView.centerYAnchor, constant: 50),
            humidityLabel.centerXAnchor.constraint(equalTo: humidityStackView.centerXAnchor, constant: 0),
            humidityLabel.heightAnchor.constraint(equalToConstant: 50),
            
            pressureLabel.topAnchor.constraint(equalTo: pressureDescriptionLabel.bottomAnchor, constant: 0),
            pressureLabel.centerYAnchor.constraint(equalTo: pressureStackView.centerYAnchor, constant: 50),
            pressureLabel.centerXAnchor.constraint(equalTo: pressureStackView.centerXAnchor, constant: 0),
            pressureLabel.heightAnchor.constraint(equalToConstant: 50),
            
            windLabel.topAnchor.constraint(equalTo: windDescriptionLabel.bottomAnchor, constant: 0),
            windLabel.centerYAnchor.constraint(equalTo: windStackView.centerYAnchor, constant: 50),
            windLabel.centerXAnchor.constraint(equalTo: windStackView.centerXAnchor, constant: 0),
            windLabel.heightAnchor.constraint(equalToConstant: 50),
        ])
    }
    
    @objc func searchButtonTapped() {
        print("search tapped")
        onSearchButtonTapped?()
    }
    
    @objc func settingsButtonTapped() {
        print("search tapped")
        onSettingsButtonTapped?()
    }
    
}
