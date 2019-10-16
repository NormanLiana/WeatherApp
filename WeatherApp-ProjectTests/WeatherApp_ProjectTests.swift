//
//  WeatherApp_ProjectTests.swift
//  WeatherApp-ProjectTests
//
//  Created by Liana Norman on 10/12/19.
//  Copyright © 2019 Liana Norman. All rights reserved.
//

import XCTest
@testable import WeatherApp_Project

class WeatherApp_ProjectTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    private func getWeatherDataFromJSON() -> Data? {
        let testBundle = Bundle(for: type(of: self))
        guard let pathToData =  testBundle.path(forResource: "Weather", ofType: "json") else {
            XCTFail("Couldn't find json file")
            return nil
        }
        let url = URL(fileURLWithPath: pathToData)
        do {
            let data = try Data(contentsOf: url)
            return data
        } catch let jsonError {
            fatalError("couldn't find data in json file: \(jsonError)")
        }
    }

    func testLoadWeather() {
        let data = getWeatherDataFromJSON() ?? Data()
        let weather = WeatherWrapper.getWeather(from: data) ?? []
        XCTAssertTrue(weather.count > 0, "No weather was loaded")
    }

}
