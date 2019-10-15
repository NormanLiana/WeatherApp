//
//  ErrorHandler.swift
//  WeatherApp-Project
//
//  Created by Liana Norman on 10/15/19.
//  Copyright © 2019 Liana Norman. All rights reserved.
//

import Foundation

enum AppError: Error {
    case unauthenticated
    case invalidJSONResponse
    case couldNotParseJSON(rawError: Error)
    case noInternetConnection
    case badURL
    case badStatusCode
    case noDataReceived
    case notAnImage
    case other(rawError: Error)
}
