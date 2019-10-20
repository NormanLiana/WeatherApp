//
//  ImageHelper.swift
//  WeatherApp-Project
//
//  Created by Liana Norman on 10/19/19.
//  Copyright © 2019 Liana Norman. All rights reserved.
//

import Foundation

import UIKit

class ImageHelper {
    private init() {}
    
    // MARK: - Static Properties
    static let shared = ImageHelper()
    
    // MARK: - Internal Methods
    func getImage(urlStr: String, cityName: String, completionHandler: @escaping (Result<UIImage,AppError>) -> ()) {
        
        
        
        guard let url = URL(string: urlStr) else {
            completionHandler(.failure(.badURL))
            return
        }
        
        URLSession.shared.dataTask(with: url) { (data, _, error) in
            guard error == nil else {
                completionHandler(.failure(.noDataReceived))
                return
            }
            
            guard let data = data else {
                completionHandler(.failure(.noDataReceived))
                return
            }
            
            guard let image = UIImage(data: data) else {
                completionHandler(.failure(.notAnImage))
                return
            }
            
            completionHandler(.success(image))
            
        } .resume()
        
    }
    
}
