//
//  WeatherAPIClient.swift
//  WeatherApp-Project
//
//  Created by Liana Norman on 10/15/19.
//  Copyright © 2019 Liana Norman. All rights reserved.
//

import Foundation

class WeatherAPIManager {
    private init() {}
    
    static let shared = WeatherAPIManager()
    
    func getWeather(completionHandler: @escaping (Result<[WeatherWrapper], AppError>) -> () ) {
        let urlStr = ""
        
        guard let url = URL(string: urlStr) else {
            completionHandler(.failure(.badURL))
            return
        }
        NetworkHelper.manager.performDataTask(withUrl: url, andMethod: .get) { (result) in
            switch result {
            case .failure(let error):
                completionHandler(.failure(error))
            case .success(let data):
                do {
                    let weatherInfo = try JSONDecoder().decode([WeatherWrapper].self, from: data)
                    
                    completionHandler(.success(weatherInfo))
                } catch {
                    completionHandler(.failure(.couldNotParseJSON(rawError: error)))
                }
            }
        }
    }
    

    
    
}
