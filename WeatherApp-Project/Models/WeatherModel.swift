//
//  WeatherModel.swift
//  WeatherApp-Project
//
//  Created by Liana Norman on 10/14/19.
//  Copyright © 2019 Liana Norman. All rights reserved.
//

import Foundation
import UIKit

struct WeatherWrapper: Codable {
    let daily: Weather
    let timezone: String
    
    static func decodeWeather(from data: Data) -> [DataWrapper]? {
        do {
           let newWeather = try JSONDecoder().decode(WeatherWrapper.self, from: data)
            return newWeather.daily.data
        } catch let decodeError {
           print(decodeError)
            return nil
        }
    }
    
}

struct Weather: Codable {
    let icon: String
    let data: [DataWrapper]
    
}

struct DataWrapper: Codable {
    let time: Int
    let icon: String
    let summary: String
    let temperatureHigh: Double
    let temperatureLow: Double
    let sunriseTime: Int
    let sunsetTime: Int
    let windSpeed: Double
    
    
  
    func formatDate(time:Int) -> String {
        let date = NSDate(timeIntervalSince1970: TimeInterval(time))
        let dateFormatter = DateFormatter()
        dateFormatter.timeStyle = DateFormatter.Style.medium //Set time style
        dateFormatter.dateStyle = DateFormatter.Style.medium //Set date style
        let testDate = dateFormatter.string(from: date as Date)
        return testDate.components(separatedBy: " at")[0]
    }
    
    func returnPictureBasedOnIcon(icon:String) -> UIImage {
        switch icon {
        case "rain":
            return UIImage(named: "rain")!
        case "cloudy":
            return UIImage(named: "cloudy")!
        case "partly-cloudy-night":
            return UIImage(named: "pcloudyn")!
        case "clear-day":
            return UIImage(named: "clear")!
        case "clear-night":
            return UIImage(named:"clearn")!
        case "partly-cloudy-day":
            return UIImage(named:"pcloudy" )!
        case "snow":
            return UIImage(named: "snow")!
        case "sleet":
            return UIImage(named: "sleet")!
        case "wind":
            return UIImage(named: "wind")!
        case "fog":
            return UIImage(named:"fog")!
        default:
            return UIImage(named: "image")!
        }
    }

}



