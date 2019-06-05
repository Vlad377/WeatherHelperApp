//
//  RecommendationViewController.swift
//  WeatherHelper
//
//  Created by 123 on 1/24/19.
//  Copyright © 2019 Vladyslav Zhulavskyi. All rights reserved.
//

import UIKit

class RecommendationViewController: UIViewController {
    
    var controller = RecommendationController()
    
    //MARK: IBoutlets
    
    @IBOutlet weak var cityNameLabel: UILabel!
    
    @IBOutlet weak var temperatureLabel: UILabel!
    
    @IBOutlet weak var summaryLbl: UILabel!
    
    @IBOutlet weak var weatherIcon: UIImageView!
    
    @IBOutlet weak var recomendationTableView: UITableView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        recomendationTableView.delegate = self
        recomendationTableView.dataSource = self
        
        recomendationTableView.register(UINib(nibName: "RecomendationTableViewCell", bundle: nil), forCellReuseIdentifier: "RecomendationTableViewCell")
        
        
        temperatureLabel.text = "\(City.shared.temperatureDouble.last!)°C"
        cityNameLabel.text = City.shared.nameString
        summaryLbl.text = City.shared.summaryString.last!
        weatherIcon.image = City.shared.weatherIcon
        
    }
}

extension RecommendationViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 75.0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return controller.getRecomendations().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let currentRecomendation = controller.getRecomendations()[indexPath.row]
        
        let cell = recomendationTableView.dequeueReusableCell(withIdentifier: "RecomendationTableViewCell", for: indexPath) as! RecomendationTableViewCell
        
        cell.item.text = currentRecomendation.recommendation
        
        return cell
    }
    
}
