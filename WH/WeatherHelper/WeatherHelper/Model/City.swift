//
//  City.swift
//  WeatherHelper
//
//  Created by 123 on 1/24/19.
//  Copyright © 2019 Vladyslav Zhulavskyi. All rights reserved.
//

import UIKit

let cityCoordinates = ["Lviv" : [42.3601, -71.0589],
                       "Kyiv": [50.45466, 30.5238],
                       "Kharkiv": [49.988358, 36.232845],
                       "Odessa": [28.183554,-82.557617],
                       "Lutsk": [50.745073, 25.320078],
                       "Ternopil": [49.555772,25.591886],
                       "Vinnytsia": [49.2331,28.4682],
                       "Mariupol": [47.0971,37.5434],
                       "Dnipro": [48.4647,35.0462]]


struct City {
    static var shared = City()
    var nameString = ""
    var summaryString = [String]()
    var temperatureDouble = [Int]()
    var weatherIcon = UIImage(imageLiteralResourceName: "rain")
}
