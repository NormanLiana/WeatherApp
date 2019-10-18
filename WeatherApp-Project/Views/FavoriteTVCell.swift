//
//  FavoriteTVCell.swift
//  WeatherApp-Project
//
//  Created by Liana Norman on 10/17/19.
//  Copyright © 2019 Liana Norman. All rights reserved.
//

import UIKit

class FavoriteTVCell: UITableViewCell {

    // MARK: UI Objects
    lazy var cityImageView: UIImageView = {
        let image = UIImageView()
        return image
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.contentView.addSubview(cityImageView)
        configureImageView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Contraint Methods
    private func configureImageView() {
        cityImageView.translatesAutoresizingMaskIntoConstraints = false
        
        
        [cityImageView.topAnchor.constraint(equalTo: contentView.topAnchor), cityImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor), cityImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor), cityImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)].forEach({$0.isActive = true})
    }
}
