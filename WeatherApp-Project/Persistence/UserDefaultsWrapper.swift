//
//  UserDefaultsWrapper.swift
//  WeatherApp-Project
//
//  Created by Liana Norman on 10/20/19.
//  Copyright © 2019 Liana Norman. All rights reserved.
//

import Foundation

class UserDefaultsWrapper {
    
    // MARK: - Singleton
    static let standard = UserDefaultsWrapper()
    
    // MARK: - Private Keys
    private let zipcodeKey = "zipcode"
    
    // MARK: - Getters
    func getZipcode() -> String? {
        return UserDefaults.standard.value(forKey: zipcodeKey) as? String
    }
    
    // MARK: - Setters
    func setZipcode(zipcode: String) {
        UserDefaults.standard.set(zipcode, forKey: zipcodeKey)
    }
    
}
