//
//  CitiesController.swift
//  WeatherHelper
//
//  Created by Vladyslav Zhulavskyi on 1/23/19.
//  Copyright © 2019 Vladyslav Zhulavskyi. All rights reserved.
//

import UIKit

class CitiesController: NSObject {
    //    var shared = City.shared
    var cities = Array(cityCoordinates.keys)
    
    func startJSON(string: String) {
        let sampleDataAddress = string
        let url = URL(string: sampleDataAddress)
        let jsonData = try! Data(contentsOf: url!)
        do {
            let decoder = JSONDecoder()
            let user = try decoder.decode(WeatherData.self, from: jsonData)
            for index in 0..<12 {
                City.shared.summaryString.append(user.hourly.data[index].summary)
            }
            for index in 0..<12 {
                City.shared.temperatureDouble.append(self.farenheitToCelcius(user.hourly.data[index].temperature))
            }
            
        } catch {
            print(error.localizedDescription)
        }
        //            print(City.shared.summaryString)
        //            print(City.shared.temperatureDouble)
    }
    
    func farenheitToCelcius(_ farenheit: Double) -> Int{
        return Int(round((farenheit - 32)*5/9))
    }
}
