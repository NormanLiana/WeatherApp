//
//  PictureModel.swift
//  WeatherApp-Project
//
//  Created by Liana Norman on 10/19/19.
//  Copyright © 2019 Liana Norman. All rights reserved.
//

import Foundation

struct Pictures: Codable {
    let totalHits: Int
    let hits: [Hit]
    let total: Int
    
    static func decodePictures(from data: Data) -> [Hit]? {
        do {
           let newPics = try JSONDecoder().decode(Pictures.self, from: data)
            return newPics.hits
        } catch let decodeError {
           print(decodeError)
            return nil
        }
    }
    
}


struct Hit: Codable {
    let largeImageURL: String
    let pageURL: String
    let webformatURL: String
    let userImageURL, previewURL: String

    
}
