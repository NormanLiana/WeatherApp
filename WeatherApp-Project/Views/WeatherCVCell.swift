//
//  WeatherCVCell.swift
//  WeatherApp-Project
//
//  Created by Liana Norman on 10/14/19.
//  Copyright © 2019 Liana Norman. All rights reserved.
//

import UIKit

class WeatherCVCell: UICollectionViewCell {
    
    lazy var highTempLabel: UILabel = {
        let lb = UILabel()
        return lb
    }()
    
    lazy var lowTempLabel: UILabel = {
        let lb = UILabel()
        return lb
    }()
    
    lazy var weatherImage: UIImageView = {
       let image = UIImageView()
        return image
    }()
}
