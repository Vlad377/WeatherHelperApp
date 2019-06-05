//
//  getJson.swift
//  WeatherHelper
//
//  Created by Vladyslav Zhulavskyi on 1/24/19.
//  Copyright © 2019 Vladyslav Zhulavskyi. All rights reserved.
//

import Foundation

final class WeatherData {
    var hourly: Hourly
    init(hourly: Hourly) {
        self.hourly = hourly
    }
}
final class Hourly {
    var summary: String
    var data: [HourlyData]
    init(summary: String, data: [HourlyData]) {
        self.summary = summary
        self.data = data
    }
}
final class HourlyData {
    var summary: String
    var temperature: Double
    init(summary: String, temperature: Double) {
        self.summary = summary
        self.temperature = temperature
    }
}
//MARK: - Extension
extension WeatherData: Decodable {
    private enum Key: String, CodingKey {
        case hourly
    }
    convenience init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: Key.self)
        let hourly = try values.decode(Hourly.self, forKey: .hourly)
        self.init(hourly: hourly)
    }
}
extension Hourly: Decodable {
    private enum Key: String, CodingKey {
        case summary
        case data
    }
    convenience init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: Key.self)
        let summary = try values.decode(String.self, forKey: .summary)
        let data = try values.decode([HourlyData].self, forKey: .data)
        self.init(summary: summary, data: data)
    }
}
extension HourlyData: Decodable {
    private enum Key: String, CodingKey {
        case summary
        case temperature
    }
    convenience init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: Key.self)
        let summary = try container.decode(String.self, forKey: .summary)
        let temperature = try container.decode(Double.self, forKey: .temperature)
        self.init(summary: summary, temperature: temperature)
    }
}
