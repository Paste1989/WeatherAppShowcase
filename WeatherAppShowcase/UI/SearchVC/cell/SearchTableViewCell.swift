//
//  SearchTableViewCell.swift
//  WeatherAppShowcase
//
//  Created by cobe on 03.09.2021..
//

import UIKit

class SearchTableViewCell: UITableViewCell {
    private lazy var locationName = UILabel()
    

    override func awakeFromNib() {
        super.awakeFromNib()
        setupCellView()
        setupConstraints()
    }
    
    private func setupCellView() {
        self.backgroundColor = .clear
        self.selectionStyle = .none
        locationName.textAlignment = .left
        locationName.font = UIFont.systemFont(ofSize: 25)
        addSubview(locationName)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.useAndActivateConstraints(constraints: [
            locationName.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            locationName.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            locationName.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 0),
            locationName.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 0),
        ])
    }
    
    func setupView(name: String) {
        locationName.text = name
    }
    
}
