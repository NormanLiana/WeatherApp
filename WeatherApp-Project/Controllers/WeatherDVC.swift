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
    
    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    


}
