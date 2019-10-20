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
        theLabel.textAlignment = .center
        theLabel.text = ""
        return theLabel
    }()
    
    lazy var weatherCV: UICollectionView = {
        let layout = UICollectionViewFlowLayout.init()
        let cv = UICollectionView(frame: CGRect(x: 0, y: 0, width: 0, height: 0), collectionViewLayout: layout)
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 250, height: 250)
        cv.backgroundColor = .white
        cv.register(WeatherCVCell.self, forCellWithReuseIdentifier: "WeatherCVCell")
        cv.dataSource = self
        cv.delegate = self
        return cv
    }()
    
    lazy var zipcodeTextField: UITextField = {
        let tf = UITextField()
        tf.backgroundColor = .red
        tf.textColor = .green
        tf.textAlignment = .center
        tf.placeholder = "Enter zipcode here and press enter"
        tf.delegate = self
        return tf
    }()
    
    // MARK: - Properties
    var zipcode = String()
    var weeklyWeather =  [DataWrapper]() {
        didSet {
            weatherCV.reloadData()
        }
    }
    var cityName = String() {
        didSet {
            cityNameLabel.text = "Weather Forecast for \(cityName)"
        }
    }
    
    var latAndLong = String() {
        didSet {
            loadData()
        }
    }
    
    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        addSubViews()
        configureWeatherCV()
        configureZipcodeTextField()
        configureCityNameLabel()
    }
    
    // MARK: - ObjC
    
    
    // MARK: - Private Methods
    private func addSubViews() {
        view.addSubview(cityNameLabel)
        view.addSubview(weatherCV)
        view.addSubview(zipcodeTextField)
    }
    
    private func zipcodeAndCityNameConfigured() {
        ZipCodeHelper.getLatLong(fromZipCode: zipcode) { (result) in
            switch result {
            case .failure(let error):
                print(error)
            case .success(let lat, let long, let name):
                self.latAndLong = "\(lat),\(long)"
                self.cityName = name
            }
        }
    }
    
    private func loadData() {
        WeatherAPIManager.shared.getWeather(latLong: latAndLong) { (result) in
            switch result {
            case .failure(let error):
                print(error)
            case .success(let weatherFromOnline):
                self.weeklyWeather = weatherFromOnline
            }
        }
    }
    
    // MARK: - Contraint Methods
    private func configureWeatherCV() {
        weatherCV.translatesAutoresizingMaskIntoConstraints = false

        [weatherCV.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor), weatherCV.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor), weatherCV.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor), weatherCV.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor, multiplier: 0.5)].forEach({$0.isActive = true})
    }
    
    private func configureZipcodeTextField() {
        zipcodeTextField.translatesAutoresizingMaskIntoConstraints = false
        
        [zipcodeTextField.topAnchor.constraint(equalTo: weatherCV.bottomAnchor), zipcodeTextField.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor), zipcodeTextField.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor), zipcodeTextField.heightAnchor.constraint(equalTo: weatherCV.heightAnchor, multiplier: 0.1)].forEach({$0.isActive = true})
    }
    
    private func configureCityNameLabel() {
        cityNameLabel.translatesAutoresizingMaskIntoConstraints = false
        
        [cityNameLabel.topAnchor.constraint(equalTo: zipcodeTextField.bottomAnchor), cityNameLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor), cityNameLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor), cityNameLabel.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor, multiplier: 0.1)].forEach({$0.isActive = true})
    }

}

// MARK: - Extensions
extension WeatherVC: UICollectionViewDelegate {}

extension WeatherVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return weeklyWeather.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = weatherCV.dequeueReusableCell(withReuseIdentifier: "WeatherCVCell", for: indexPath) as? WeatherCVCell {
            let dayWeather = weeklyWeather[indexPath.row]
            cell.dateLabel.text = dayWeather.getDateFromTime(time: dayWeather.time)
            cell.highTempLabel.text = String(dayWeather.temperatureHigh)
            cell.lowTempLabel.text = String(dayWeather.temperatureLow)
            cell.weatherImage.image = dayWeather.returnPictureBasedOnIcon(icon: dayWeather.icon)
            return cell
        }
        return UICollectionViewCell()
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let detailVC = WeatherDVC()
        let selectedDay = weeklyWeather[indexPath.row]
        detailVC.detailForecast = selectedDay
        detailVC.detailCityName = cityName
        
        self.navigationController?.pushViewController(detailVC, animated: true)
        
    }

}

extension WeatherVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 250, height: 250)
    }
}

extension WeatherVC: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.zipcode = textField.text ?? ""
        zipcodeAndCityNameConfigured()
        return true
    }
}

