//
//  PictureModel.swift
//  WeatherApp-Project
//
//  Created by Liana Norman on 10/19/19.
//  Copyright © 2019 Liana Norman. All rights reserved.
//

import Foundation

struct PictureWrapper: Codable {
    let hits: [Picture]
    
    static func decodePictures(from data: Data) -> [Picture]? {
        do {
           let newPics = try JSONDecoder().decode(PictureWrapper.self, from: data)
            return newPics.hits
        } catch let decodeError {
           print(decodeError)
            return nil
        }
    }
    
}


struct Picture: Codable {
    let largeImageURL: String
    
   
    
}
