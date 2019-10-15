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
        let layout = UICollectionViewFlowLayout.init()
        let cv = UICollectionView(frame: CGRect(x: 0, y: 0, width: 0, height: 0), collectionViewLayout: layout)
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 250, height: 250)
        return cv
    }()
    
    lazy var zipcodeTextField: UITextField = {
        let tf = UITextField()
        tf.backgroundColor = .red
        tf.textColor = .green
        tf.textAlignment = .center
        return tf
    }()
    
    // MARK: - Properties
    
    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        addSubViews()
        configureWeatherCV()
        configureZipcodeTextField()
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
    
    private func configureWeatherCV() {
        weatherCV.translatesAutoresizingMaskIntoConstraints = false

        [weatherCV.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor), weatherCV.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor), weatherCV.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor), weatherCV.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor, multiplier: 0.5)].forEach({$0.isActive = true})
    }
    
    private func configureZipcodeTextField() {
        zipcodeTextField.translatesAutoresizingMaskIntoConstraints = false
        
        [zipcodeTextField.topAnchor.constraint(equalTo: weatherCV.bottomAnchor), zipcodeTextField.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor), zipcodeTextField.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor), zipcodeTextField.heightAnchor.constraint(equalTo: weatherCV.heightAnchor, multiplier: 0.1)].forEach({$0.isActive = true})
    }

}

// MARK: - Extensions
extension WeatherVC: UICollectionViewDelegate {}

extension WeatherVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return UICollectionViewCell()
    }


}

//extension WeatherVC: UICollectionViewDelegateFlowLayout {
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        return CGSize(width: 250, height: 250)
//    }
//}
