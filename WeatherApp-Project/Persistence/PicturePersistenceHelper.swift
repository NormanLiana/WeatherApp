//
//  FileManager.swift
//  WeatherApp-Project
//
//  Created by Liana Norman on 10/20/19.
//  Copyright © 2019 Liana Norman. All rights reserved.
//

import Foundation

struct PicturePersistHelper {
    
    static let manager = PicturePersistHelper()
    
    func savePhoto(newPhoto: Picture) throws {
        try persistenceHelper.save(newElement: newPhoto)
    }
    
    func getPhoto() throws -> [Picture] {
        return try persistenceHelper.getObjects()
    }
    
    private let persistenceHelper = PersistenceManager<Picture>(fileName: "pictures.plist")
    
    private init() {}
}
