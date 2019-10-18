//
//  WeatherDVC.swift
//  WeatherApp-Project
//
//  Created by Liana Norman on 10/16/19.
//  Copyright © 2019 Liana Norman. All rights reserved.
//

import UIKit

class WeatherDVC: UIViewController {

    // MARK: - UI Objects
    lazy var cityNameLabel: UILabel = {
        let lb = UILabel()
        lb.backgroundColor = .white
        lb.textColor = .black
        lb.textAlignment = .center
        return lb
    }()
    
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
    
    lazy var sunriseLabel: UILabel = {
        let lb = UILabel()
        lb.backgroundColor = .white
        lb.textColor = .black
        lb.textAlignment = .center
        return lb
    }()
    
    lazy var sunsetLabel: UILabel = {
        let lb = UILabel()
        lb.backgroundColor = .white
        lb.textColor = .black
        lb.textAlignment = .center
        return lb
    }()
    
    lazy var windspeedLabel: UILabel = {
        let lb = UILabel()
        lb.backgroundColor = .white
        lb.textColor = .black
        lb.textAlignment = .center
        return lb
    }()
    
    lazy var precipLabel: UILabel = {
        let lb = UILabel()
        lb.backgroundColor = .white
        lb.textColor = .black
        lb.textAlignment = .center
        return lb
    }()
    
    lazy var weatherDescriptionLabel: UILabel = {
        let lb = UILabel()
        lb.backgroundColor = .white
        lb.textColor = .black
        lb.textAlignment = .center
        return lb
    }()
    
    lazy var cityImageView: UIImageView = {
        let iv = UIImageView()
        iv.backgroundColor = .green
        return iv
    }()
    
    // MARK: - Properties
    var detailForecast: DataWrapper!
    
    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        configureCityNameLabel()
        configureDateLabel()
        configureImageView()
        configureStackView()
        setupViews()
    }
    
    //MARK: Private Methods
    private func setupViews() {
        highTempLabel.text = "High Temp: \(detailForecast.temperatureHigh.description)"
        lowTempLabel.text = "Low Temp: \(detailForecast.temperatureLow.description)"
        sunriseLabel.text = "Sunrise: \(detailForecast.sunriseTime.description)"
        sunsetLabel.text = "Sunset: \(detailForecast.sunsetTime.description)"
        windspeedLabel.text = "Windspeed: \(detailForecast.windSpeed.description)"
        weatherDescriptionLabel.text = detailForecast.summary
    }
    
    // MARK: - Contraint Methods
    private func configureCityNameLabel() {
        cityNameLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(cityNameLabel)
        
        [cityNameLabel.topAnchor.constraint(equalTo: view.topAnchor), cityNameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor), cityNameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor), cityNameLabel.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.1)].forEach({$0.isActive = true})
    }
    
    private func configureDateLabel() {
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(dateLabel)
        
        [dateLabel.topAnchor.constraint(equalTo: cityNameLabel.bottomAnchor), dateLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor), dateLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor), dateLabel.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.1)].forEach({$0.isActive = true})
    }
    
    private func configureImageView() {
        cityImageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(cityImageView)
        
        [cityImageView.topAnchor.constraint(equalTo: dateLabel.bottomAnchor), cityImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor), cityImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor), cityImageView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.5)].forEach({$0.isActive = true})
    }
    
    private func configureStackView() {
        let stackView = UIStackView(arrangedSubviews: [weatherDescriptionLabel, highTempLabel, lowTempLabel, sunriseLabel, sunsetLabel, windspeedLabel, precipLabel])
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 0
        stackView.distribution = .fillEqually
        view.addSubview(stackView)
        
        [stackView.topAnchor.constraint(equalTo: cityImageView.bottomAnchor), stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor), stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor), stackView.bottomAnchor.constraint(equalTo: view.bottomAnchor)].forEach({$0.isActive = true})
    }

}
