//
//  RecommendationController.swift
//  WeatherHelper
//
//  Created by 123 on 1/24/19.
//  Copyright © 2019 Vladyslav Zhulavskyi. All rights reserved.
//

import UIKit

class RecommendationController: NSObject {
    static var recommnedations = [Recommendation]()
    
    func getRecomendations() -> [Recommendation]{
        return RecommendationController.recommnedations
    }
    
    func updateRecomendation(){
        switch City.shared.summaryString.last! {
        case "Clear":
            City.shared.weatherIcon = UIImage(imageLiteralResourceName: "clear-day")
            RecommendationController.recommnedations = [Recommendation(recommendation: "Good mood")]
        case "Overcast", "Foggy", "Mostly Cloudy", "Partly Cloudy" :
            City.shared.weatherIcon = UIImage(imageLiteralResourceName: "partly cloudy")
            RecommendationController.recommnedations = [Recommendation(recommendation: "Jacket"), Recommendation(recommendation: "Shoes"), Recommendation(recommendation: "Hat")]
        case "Snow", "Possible Light Snow":
            City.shared.weatherIcon = UIImage(imageLiteralResourceName: "snow")
            RecommendationController.recommnedations = [Recommendation(recommendation: "Coat"), Recommendation(recommendation: "Jumper"), Recommendation(recommendation: "Scarf"),
                                                        Recommendation(recommendation: "Gloves")]
        default:
            City.shared.weatherIcon = UIImage(imageLiteralResourceName: "thunder")
            RecommendationController.recommnedations = [Recommendation(recommendation: "Coat"), Recommendation(recommendation: "Tie"), Recommendation(recommendation: "Socks"),
                                                        Recommendation(recommendation: "Sweater")]
        }
        
        
    }
}
