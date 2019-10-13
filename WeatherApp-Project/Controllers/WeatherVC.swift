//
//  WeatherVC.swift
//  WeatherApp-Project
//
//  Created by Liana Norman on 10/12/19.
//  Copyright © 2019 Liana Norman. All rights reserved.
//

import UIKit

class WeatherVC: UIViewController {

    // MARK: - UI Objects
    lazy var cityNameLabel: UILabel = {
        let theLabel = UILabel()
        theLabel.backgroundColor = .blue
        theLabel.textColor = .white
        return theLabel
    }()
    
    lazy var weatherCV: UICollectionView = {
        let cv = UICollectionView()
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        return cv
    }()
    
    lazy var zipcodeTextField: UITextField = {
        let tf = UITextField()
        return tf
    }()
    
    // MARK: - Properties
    
    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
//        configureWeatherCV()
    }
    
    // MARK: - ObjC
    
    
    // MARK: - Private Methods
    private func addSubViews() {
        view.addSubview(cityNameLabel)
        view.addSubview(weatherCV)
        view.addSubview(zipcodeTextField)
    }
    
    // MARK: - Contraint Methods
    private func configureCityNameLabel() {
        cityNameLabel.translatesAutoresizingMaskIntoConstraints = false
    }
    
//    private func configureWeatherCV() {
//        weatherCV.translatesAutoresizingMaskIntoConstraints = false
//
//        [weatherCV.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor), weatherCV.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor), weatherCV.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor), weatherCV.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor, multiplier: 0.5)].forEach({$0.isActive = true})
//    }
    
    private func configureZipcodeTextField() {
        zipcodeTextField.translatesAutoresizingMaskIntoConstraints = false
    }

}

// MARK: - Extensions