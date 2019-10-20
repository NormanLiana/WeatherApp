//
//  FavoriteVC.swift
//  WeatherApp-Project
//
//  Created by Liana Norman on 10/12/19.
//  Copyright © 2019 Liana Norman. All rights reserved.
//

import UIKit

class FavoriteVC: UIViewController {
    
    // MARK: - UI Objects
    lazy var favoriteTV: UITableView = {
       let tv = UITableView()
        tv.register(FavoriteTVCell.self, forCellReuseIdentifier: "FavoriteTVCell")
        tv.dataSource = self
        tv.delegate = self
        return tv
    }()
    
    // MARK: - Properties
    var favorites: Picture! {
        didSet {
            favoriteTV.reloadData()
        }
    }
    
    
    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
    }
    
    // MARK: - Contraint Methods
    private func configureTableView() {
        favoriteTV.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(favoriteTV)
        
        [favoriteTV.topAnchor.constraint(equalTo: view.topAnchor), favoriteTV.leadingAnchor.constraint(equalTo: view.leadingAnchor), favoriteTV.trailingAnchor.constraint(equalTo: view.trailingAnchor), favoriteTV.bottomAnchor.constraint(equalTo: view.bottomAnchor)].forEach({$0.isActive = true})
    }
    


}
// MARK: - Extensions
extension FavoriteVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = favoriteTV.dequeueReusableCell(withIdentifier: "FavoriteTVCell", for: indexPath) as? FavoriteTVCell {
            cell.cityImageView.backgroundColor = .green
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 300
    }
    
}

extension FavoriteVC: UITableViewDelegate {}
