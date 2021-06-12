//
//  WeatherModel.swift
//  Weather
//
//  Created by Antonio Flores on 6/12/21.
//

import Foundation

struct Weather: Codable {
    let latitude: Double
    let longitude: Double
    let timezone: String
    let currently: Today
    let daily: Daily

}

struct Today:Codable {
    let time: Int
        let summary: String
        let icon: String
        let temperature: Double
        let humidity: Double
        let uvIndex: Double
        let visibility: Double
}

struct Daily:Codable {
    let summary: String
    let icon: String
    let data: [Dailydata]
}

struct Dailydata:Codable {
    let time: Int
    let summary: String
    let icon: String
    let temperatureHigh: Double
    let temperatureLow: Double
    let humidity:Double
    let windSpeed: Double
    let uvIndex: Double
    let visibility:Double
    let temperatureMin: Double
    let temperatureMax: Double
}
