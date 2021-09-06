//
//  SettingsView.swift
//  WeatherAppShowcase
//
//  Created by cobe on 03.09.2021..
//

import Foundation
import UIKit

class SettingsView: UIView {
    private lazy var backgroundImageView = UIImageView()
    private lazy var celsiusView = UIImageView()
    private lazy var fahrenheitView = UIImageView()
    private lazy var celsiusButton = UIButton(type: .system)
    private lazy var fahrenheitButton = UIButton(type: .system)
    private lazy var celsiusDescriptionLabel = UILabel()
    private lazy var fahrenheitDescriptionLabel = UILabel()
    private lazy var mainStackView = UIStackView()
    private lazy var humidityStackView = UIStackView()
    private lazy var pressureStackView = UIStackView()
    private lazy var windStackView = UIStackView()
    private lazy var humidityImageView = UIImageView()
    private lazy var pressureImageView = UIImageView()
    private lazy var windImageView = UIImageView()
    private lazy var humidityView = UIImageView()
    private lazy var pressureView = UIImageView()
    private lazy var windView = UIImageView()
    private lazy var humidtyButton = UIButton(type: .system)
    private lazy var pressureButton = UIButton(type: .system)
    private lazy var windButton = UIButton(type: .system)
    
    var onCelsiusButtonTapped: ((Int)->Void)?
    var onFahrenheitButtonTapped: ((Int)->Void)?
    var onHumidityButtonTapped: ((Int)->Void)?
    var onPressureButtonTapped: ((Int)->Void)?
    var onWindButtonTapped: ((Int)->Void)?
    
    
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
        
        celsiusButton.setImage(UIImage(named: "check"), for: .normal)
        celsiusButton.addTarget(self, action: #selector(celsiusButtonTapped), for: .touchUpInside)
        celsiusButton.tag = 0
        addSubview(celsiusButton)
        
        fahrenheitButton.setImage(UIImage(named: ""), for: .normal)
        fahrenheitButton.addTarget(self, action: #selector(fahrenheitButtonTapped), for: .touchUpInside)
        fahrenheitButton.tag = 1
        addSubview(fahrenheitButton)
        
        celsiusView.backgroundColor = .white
        backgroundImageView.addSubview(celsiusView)
        
        fahrenheitView.backgroundColor = .white
        backgroundImageView.addSubview(fahrenheitView)
        
        celsiusDescriptionLabel.text = "Celsius"
        celsiusDescriptionLabel.contentMode = .center
        celsiusDescriptionLabel.font = UIFont.systemFont(ofSize: 30)
        backgroundImageView.addSubview(celsiusDescriptionLabel)
        
        fahrenheitDescriptionLabel.text = "Fahrenheit"
        fahrenheitDescriptionLabel.contentMode = .center
        fahrenheitDescriptionLabel.font = UIFont.systemFont(ofSize: 30)
        backgroundImageView.addSubview(fahrenheitDescriptionLabel)
        
        mainStackView.backgroundColor = .clear
        mainStackView.axis = .horizontal
        mainStackView.distribution  = .fillEqually
        mainStackView.spacing = 10
        backgroundImageView.addSubview(mainStackView)
        
        humidityStackView.backgroundColor = .clear
        humidityStackView.axis = .vertical
        humidityStackView.distribution  = .fillEqually
        humidityStackView.spacing = 10
        mainStackView.addSubview(humidityStackView)
        
        pressureStackView.backgroundColor = .clear
        pressureStackView.axis = .vertical
        pressureStackView.distribution  = .fillEqually
        pressureStackView.spacing = 10
        mainStackView.addSubview(pressureStackView)
        
        windStackView.backgroundColor = .clear
        windStackView.axis = .vertical
        windStackView.distribution  = .fillEqually
        windStackView.spacing = 10
        mainStackView.addSubview(windStackView)
        
        humidityImageView.image = UIImage(named: "humidity")
        humidityImageView.contentMode = .scaleAspectFit
        humidityStackView.addSubview(humidityImageView)
        
        pressureImageView.image = UIImage(named: "pressure")
        pressureImageView.contentMode = .scaleAspectFit
        pressureStackView.addSubview(pressureImageView)
        
        windImageView.image = UIImage(named: "wind")
        windImageView.contentMode = .scaleAspectFit
        windStackView.addSubview(windImageView)
        
        humidityView.backgroundColor = .white
        humidityStackView.addSubview(humidityView)
        
        pressureView.backgroundColor = .white
        pressureStackView.addSubview(pressureView)
        
        windView.backgroundColor = .white
        windStackView.addSubview(windView)
        
        humidtyButton.setImage(UIImage(named: "check"), for: .normal)
        humidtyButton.addTarget(self, action: #selector(humidityButtonTapped), for: .touchUpInside)
        humidtyButton.tag = 2
        addSubview(humidtyButton)
        
        pressureButton.setImage(UIImage(named: "check"), for: .normal)
        pressureButton.addTarget(self, action: #selector(pressureButtonTapped), for: .touchUpInside)
        pressureButton.tag = 3
        addSubview(pressureButton)
        
        windButton.setImage(UIImage(named: "check"), for: .normal)
        windButton.addTarget(self, action: #selector(windButtonTapped), for: .touchUpInside)
        windButton.tag = 4
        addSubview(windButton)
        
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.useAndActivateConstraints(constraints: [
            backgroundImageView.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            backgroundImageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0),
            backgroundImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            backgroundImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            
            celsiusView.heightAnchor.constraint(equalToConstant: 30),
            celsiusView.widthAnchor.constraint(equalToConstant: 30),
            celsiusView.topAnchor.constraint(equalTo: backgroundImageView.topAnchor, constant: 250),
            celsiusView.leadingAnchor.constraint(equalTo: backgroundImageView.leadingAnchor, constant: 25),
            
            celsiusButton.centerXAnchor.constraint(equalTo: celsiusView.centerXAnchor, constant: 0),
            celsiusButton.centerYAnchor.constraint(equalTo: celsiusView.centerYAnchor, constant: 0),
            celsiusButton.heightAnchor.constraint(equalToConstant: 35),
            celsiusButton.widthAnchor.constraint(equalToConstant: 35),
            
            celsiusDescriptionLabel.topAnchor.constraint(equalTo: backgroundImageView.topAnchor, constant: 250),
            celsiusDescriptionLabel.leadingAnchor.constraint(equalTo: celsiusButton.trailingAnchor, constant: 25),
            celsiusDescriptionLabel.trailingAnchor.constraint(equalTo: backgroundImageView.trailingAnchor, constant: -25),
            celsiusDescriptionLabel.heightAnchor.constraint(equalToConstant: 35),
            
            fahrenheitView.heightAnchor.constraint(equalToConstant: 30),
            fahrenheitView.widthAnchor.constraint(equalToConstant: 30),
            fahrenheitView.topAnchor.constraint(equalTo: celsiusView.topAnchor, constant: 65),
            fahrenheitView.leadingAnchor.constraint(equalTo: backgroundImageView.leadingAnchor, constant: 25),
            
            fahrenheitButton.centerXAnchor.constraint(equalTo: fahrenheitView.centerXAnchor, constant: 0),
            fahrenheitButton.centerYAnchor.constraint(equalTo: fahrenheitView.centerYAnchor, constant: 0),
            fahrenheitButton.heightAnchor.constraint(equalToConstant: 35),
            fahrenheitButton.widthAnchor.constraint(equalToConstant: 35),
            
            fahrenheitDescriptionLabel.topAnchor.constraint(equalTo: celsiusDescriptionLabel.topAnchor, constant: 65),
            fahrenheitDescriptionLabel.leadingAnchor.constraint(equalTo: celsiusButton.trailingAnchor, constant: 25),
            fahrenheitDescriptionLabel.trailingAnchor.constraint(equalTo: backgroundImageView.trailingAnchor, constant: -25),
            fahrenheitDescriptionLabel.heightAnchor.constraint(equalToConstant: 35),
            
            
            mainStackView.leadingAnchor.constraint(equalTo: backgroundImageView.leadingAnchor, constant: 25),
            mainStackView.trailingAnchor.constraint(equalTo: backgroundImageView.trailingAnchor, constant: -25),
            mainStackView.bottomAnchor.constraint(equalTo: backgroundImageView.bottomAnchor, constant: -100),
            mainStackView.heightAnchor.constraint(equalToConstant:  200),
            
            humidityStackView.topAnchor.constraint(equalTo: mainStackView.topAnchor, constant: 10),
            humidityStackView.leadingAnchor.constraint(equalTo: mainStackView.leadingAnchor, constant: 10),
            humidityStackView.bottomAnchor.constraint(equalTo: mainStackView.bottomAnchor, constant: -10),
            humidityStackView.widthAnchor.constraint(equalToConstant: 95),
            
            pressureStackView.topAnchor.constraint(equalTo: mainStackView.topAnchor, constant: 10),
            pressureStackView.leadingAnchor.constraint(equalTo: humidityStackView.trailingAnchor, constant: 10),
            pressureStackView.trailingAnchor.constraint(equalTo: windStackView.leadingAnchor, constant: -10),
            pressureStackView.bottomAnchor.constraint(equalTo: mainStackView.bottomAnchor, constant: -10),
            
            windStackView.topAnchor.constraint(equalTo: mainStackView.topAnchor, constant: 10),
            windStackView.trailingAnchor.constraint(equalTo: mainStackView.trailingAnchor, constant: -10),
            windStackView.bottomAnchor.constraint(equalTo: mainStackView.bottomAnchor, constant: -10),
            windStackView.widthAnchor.constraint(equalToConstant: 95),
            
            humidityImageView.centerXAnchor.constraint(equalTo: humidityStackView.centerXAnchor, constant: 0),
            humidityImageView.centerYAnchor.constraint(equalTo: humidityStackView.centerYAnchor, constant: -35),
            humidityImageView.heightAnchor.constraint(equalToConstant: 75),
            humidityImageView.widthAnchor.constraint(equalToConstant: 75),
            
            pressureImageView.centerXAnchor.constraint(equalTo: pressureStackView.centerXAnchor, constant: 0),
            pressureImageView.centerYAnchor.constraint(equalTo: pressureStackView.centerYAnchor, constant: -35),
            pressureImageView.heightAnchor.constraint(equalToConstant: 75),
            pressureImageView.widthAnchor.constraint(equalToConstant: 75),
            
            windImageView.centerXAnchor.constraint(equalTo: windStackView.centerXAnchor, constant: 0),
            windImageView.centerYAnchor.constraint(equalTo: windStackView.centerYAnchor, constant: -35),
            windImageView.heightAnchor.constraint(equalToConstant: 75),
            windImageView.widthAnchor.constraint(equalToConstant: 75),
            
            humidityView.centerXAnchor.constraint(equalTo: humidityStackView.centerXAnchor, constant: 0),
            humidityView.topAnchor.constraint(equalTo: humidityImageView.bottomAnchor, constant: 15),
            humidityView.heightAnchor.constraint(equalToConstant: 35),
            humidityView.widthAnchor.constraint(equalToConstant: 35),
            
            pressureView.centerXAnchor.constraint(equalTo: pressureStackView.centerXAnchor, constant: 0),
            pressureView.topAnchor.constraint(equalTo: pressureImageView.bottomAnchor, constant: 15),
            pressureView.heightAnchor.constraint(equalToConstant: 35),
            pressureView.widthAnchor.constraint(equalToConstant: 35),
            
            windView.centerXAnchor.constraint(equalTo: windStackView.centerXAnchor, constant: 0),
            windView.topAnchor.constraint(equalTo: windImageView.bottomAnchor, constant: 15),
            windView.heightAnchor.constraint(equalToConstant: 35),
            windView.widthAnchor.constraint(equalToConstant: 35),
            
            humidtyButton.centerXAnchor.constraint(equalTo: humidityView.centerXAnchor, constant: 0),
            humidtyButton.centerYAnchor.constraint(equalTo: humidityView.centerYAnchor, constant: 0),
            humidtyButton.heightAnchor.constraint(equalToConstant: 40),
            humidtyButton.widthAnchor.constraint(equalToConstant: 40),
            
            pressureButton.centerXAnchor.constraint(equalTo: pressureView.centerXAnchor, constant: 0),
            pressureButton.centerYAnchor.constraint(equalTo: pressureView.centerYAnchor, constant: 0),
            pressureButton.heightAnchor.constraint(equalToConstant: 40),
            pressureButton.widthAnchor.constraint(equalToConstant: 40),
            
            windButton.centerXAnchor.constraint(equalTo: windView.centerXAnchor, constant: 0),
            windButton.centerYAnchor.constraint(equalTo: windView.centerYAnchor, constant: 0),
            windButton.heightAnchor.constraint(equalToConstant: 40),
            windButton.widthAnchor.constraint(equalToConstant: 40),
            
        ])
        
    }
    
    func setupButtonView(celsiusON: Bool, fahrenheitON: Bool, humidityON: Bool, pressureON: Bool, windON: Bool) {
        if celsiusON {
            celsiusButton.setImage(UIImage(named: "check"), for: .normal)
        }else {
            celsiusButton.setImage(UIImage(named: ""), for: .normal)
        }
        if fahrenheitON {
            fahrenheitButton.setImage(UIImage(named: "check"), for: .normal)
        }
        else {
            fahrenheitButton.setImage(UIImage(named: ""), for: .normal)
        }
        if humidityON {
            humidtyButton.setImage(UIImage(named: "check"), for: .normal)
        }
        else {
            humidtyButton.setImage(UIImage(named: ""), for: .normal)
        }
        if pressureON {
            pressureButton.setImage(UIImage(named: "check"), for: .normal)
        }
        else {
            pressureButton.setImage(UIImage(named: ""), for: .normal)
        }
        if windON {
            windButton.setImage(UIImage(named: "check"), for: .normal)
        }
        else {
            windButton.setImage(UIImage(named: ""), for: .normal)
        }
    }
    
    func prepareForStoreSetttings() -> Settings {
        let checkImage = UIImage(named: "check")
        let settings = Settings(isCelsiusON: celsiusButton.image(for: .normal) == checkImage, isFahreheitON: fahrenheitButton.image(for: .normal) == checkImage, isHumidityON: humidtyButton.image(for: .normal) == checkImage, isPressureON: pressureButton.image(for: .normal) == checkImage, isWindON: windButton.image(for: .normal) == checkImage)
        return settings
    }
    
    func checkButtonTapped(buttonTag: Int) {
        if buttonTag == 0 {
            setupButtonImage(celsiusButton)
        }
        else if buttonTag == 1 {
           setupButtonImage(fahrenheitButton)
        }
        else if buttonTag == 2 {
           setupButtonImage(humidtyButton)
        }
        else if buttonTag == 3 {
           setupButtonImage(pressureButton)
        }
        else if buttonTag == 4 {
           setupButtonImage(windButton)
        }
    }
    
    private func setupButtonImage(_ button: UIButton) {
        if button.image(for: .normal) == UIImage(named: "") {
            button.setImage(UIImage(named: "check"), for: .normal)
        }
        else {
            button.setImage(UIImage(named: ""), for: .normal)
        }
    }
    
    @objc func celsiusButtonTapped() {
        print("celsius tapped")
        onCelsiusButtonTapped?(celsiusButton.tag)
    }
    
    @objc func fahrenheitButtonTapped() {
        print("fahrenheit tapped")
        onFahrenheitButtonTapped?(fahrenheitButton.tag)
    }
    
    @objc func humidityButtonTapped() {
        print("humidity tapped")
        onHumidityButtonTapped?(humidtyButton.tag)
    }
    
    @objc func pressureButtonTapped() {
        print("pressure tapped")
        onPressureButtonTapped?(pressureButton.tag)
    }
    
    @objc func windButtonTapped() {
        print("wind tapped")
        onWindButtonTapped?(windButton.tag)
    }
}
