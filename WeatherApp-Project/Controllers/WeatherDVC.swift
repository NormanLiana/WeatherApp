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
    
    lazy var savePictureToFavesButton: UIBarButtonItem = {
        let butt = UIBarButtonItem(title: "Save Photo", style: UIBarButtonItem.Style.plain, target: self, action: #selector(savePhotoButtonPressed))
       return butt
    }()
    
    // MARK: - Properties
    var detailForecast: DataWrapper!
    var detailCityName: String!
    var loadedPicture: Picture!
    
    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.rightBarButtonItem = savePictureToFavesButton
        configureCityNameLabel()
        configureDateLabel()
        configureImageView()
        configureStackView()
        setupViews()
    }
    
    // MARK: - ObjC
    @objc func savePhotoButtonPressed() {
        try? PicturePersistHelper.manager.savePhoto(newPhoto: loadedPicture)
    }
    
    //MARK: Private Methods
    private func setupViews() {
        cityNameLabel.text = "Weather Forecast for \(detailCityName!)"
        dateLabel.text = "Date: \(detailForecast.formatDate(time: detailForecast.time))"
        highTempLabel.text = "High Temp: \(detailForecast.temperatureHigh.description)"
        lowTempLabel.text = "Low Temp: \(detailForecast.temperatureLow.description)"
        sunriseLabel.text = "Sunrise: \(detailForecast.sunriseTime.description)"
//        sunsetLabel.text = "Sunset: \(detailForecast.formatDate(time: detailForecast.sunsetTime))"
        windspeedLabel.text = "Windspeed: \(detailForecast.windSpeed.description)"
        weatherDescriptionLabel.text = detailForecast.summary
        loadPictureData()
    }
    
    private func convertPictureFromData(onePic: Picture) {
        let urlString = onePic.largeImageURL
        
        ImageHelper.shared.getImage(urlStr: urlString) { (result) in
            DispatchQueue.main.async {
                switch result {
                case .failure(let error):
                    print(error)
                case .success(let pictureFromData):
                    self.cityImageView.image = pictureFromData
                }
            }
        }
    }
    
    private func loadPictureData() {
        let formattedString = PictureAPIManager.shared.formatCityNameForURL(cityName: detailCityName)
        
        PictureAPIManager.shared.getPictures(urlStr: formattedString) { (result) in
            DispatchQueue.main.async {
                switch result {
                case .failure(let error):
                    print(error)
                case .success(let imagesFromOnline):
                    if let onePic = Picture.getOnePictureForDVC(pictures: imagesFromOnline) {
                        self.convertPictureFromData(onePic: onePic)
                        self.loadedPicture = onePic
                    }
                }
            }
        }
    }
    
    
    
    // MARK: - Contraint Methods
    private func configureCityNameLabel() {
        cityNameLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(cityNameLabel)
        
        [cityNameLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor), cityNameLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor), cityNameLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor), cityNameLabel.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor, multiplier: 0.1)].forEach({$0.isActive = true})
    }
    
    private func configureDateLabel() {
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(dateLabel)
        
        [dateLabel.topAnchor.constraint(equalTo: cityNameLabel.bottomAnchor), dateLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor), dateLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor), dateLabel.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor, multiplier: 0.1)].forEach({$0.isActive = true})
    }
    
    private func configureImageView() {
        cityImageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(cityImageView)
        
        [cityImageView.topAnchor.constraint(equalTo: dateLabel.bottomAnchor), cityImageView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor), cityImageView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor), cityImageView.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor, multiplier: 0.5)].forEach({$0.isActive = true})
    }
    
    private func configureStackView() {
        let stackView = UIStackView(arrangedSubviews: [weatherDescriptionLabel, highTempLabel, lowTempLabel, sunriseLabel, sunsetLabel, windspeedLabel, precipLabel])
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 0
        stackView.distribution = .fillEqually
        view.addSubview(stackView)
        
        [stackView.topAnchor.constraint(equalTo: cityImageView.bottomAnchor), stackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor), stackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor), stackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)].forEach({$0.isActive = true})
    }

}
