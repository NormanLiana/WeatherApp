//
//  WeatherCVCell.swift
//  WeatherApp-Project
//
//  Created by Liana Norman on 10/14/19.
//  Copyright © 2019 Liana Norman. All rights reserved.
//

import UIKit

class WeatherCVCell: UICollectionViewCell {
    
    // MARK: - UI Objects
    lazy var dateLabel: UILabel = {
        let lb = UILabel()
        lb.backgroundColor = .white
        lb.textColor = .black
        lb.textAlignment = .center
        return lb
    }()
    
    lazy var highTempLabel: UILabel = {
        let lb = UILabel()
        lb.backgroundColor = .white
        lb.textColor = .black
        lb.textAlignment = .center
        return lb
    }()
    
    lazy var lowTempLabel: UILabel = {
        let lb = UILabel()
        lb.backgroundColor = .white
        lb.textColor = .black
        lb.textAlignment = .center
        return lb
    }()
    
    lazy var weatherImage: UIImageView = {
       let image = UIImageView()
        image.backgroundColor = .green
        return image
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureDateLabel()
        configureImage()
        configureStackView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - Contraint Methods
    private func configureDateLabel() {
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(dateLabel)
        
        [dateLabel.topAnchor.constraint(equalTo: contentView.topAnchor), dateLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor), dateLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor), dateLabel.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.1)].forEach({$0.isActive = true})
    }
    
    private func configureImage() {
        weatherImage.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(weatherImage)

        [weatherImage.topAnchor.constraint(equalTo: dateLabel.bottomAnchor), weatherImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor), weatherImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor), weatherImage.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.7)].forEach({$0.isActive = true})
    }
    
    
    
    private func configureStackView() {
        let stackView = UIStackView(arrangedSubviews: [highTempLabel, lowTempLabel])
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 0
        stackView.distribution = .fillEqually
        contentView.addSubview(stackView)
        
        [stackView.topAnchor.constraint(equalTo: weatherImage.bottomAnchor), stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor), stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor), stackView.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.2)].forEach({$0.isActive = true})

    }
    
    
}
