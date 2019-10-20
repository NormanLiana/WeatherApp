//
//  PictureAPIClient.swift
//  WeatherApp-Project
//
//  Created by Liana Norman on 10/19/19.
//  Copyright © 2019 Liana Norman. All rights reserved.
//

import Foundation

class PictureAPIManager {
    private init() {}
    
    static let shared = PictureAPIManager()
    
    func getPictures(cityName: String, completionHandler: @escaping (Result<[Picture], AppError>) -> () ) {
        let urlStr = "https://pixabay.com/api/?key=\(Secret.picAPIKey)&q=\(cityName)&page=1&per_page=5"
        
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
                    let picInfo = try JSONDecoder().decode(PictureWrapper.self, from: data)

                    completionHandler(.success(picInfo.hits))
                } catch {
                    completionHandler(.failure(.couldNotParseJSON(rawError: error)))
                }
            }
        }
    }
    

    
    
}
