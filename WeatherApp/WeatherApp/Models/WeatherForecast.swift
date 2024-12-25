//
//  WeatherForecast.swift
//  WeatherApp
//
//  Created by Surya Vummadi on 24/12/24.
//

import Foundation

// MARK: - WeatherForecast
struct WeatherForecast: Codable {
    let cod: String
    let message, cnt: Int
    let list: [ListForecastModel]
    let city: CityForecastModel
}

// MARK: - City
struct CityForecastModel: Codable {
    let id: Int
    let name: String
    let coord: Coord
    let country: String
    let population, timezone, sunrise, sunset: Int
}

// MARK: - List
struct ListForecastModel: Codable {
    let dt: Int
    let main: MainClassForecastModel
    let weather: [Weather]
    let clouds: Clouds
    let wind: WindForecastModel
    let visibility: Int
    let pop: Double
    let sys: SysForecastModel
    let dtTxt: String
    let rain: RainForecastModel?
    let snow: SnowForecastModel?

    enum CodingKeys: String, CodingKey {
        case dt, main, weather, clouds, wind, visibility, pop, sys
        case dtTxt = "dt_txt"
        case rain
        case snow
    }
}


// MARK: - MainClass
struct MainClassForecastModel: Codable {
    let temp, feelsLike, tempMin, tempMax: Double
    let pressure, seaLevel, grndLevel, humidity: Int
    let tempKf: Double

    enum CodingKeys: String, CodingKey {
        case temp
        case feelsLike = "feels_like"
        case tempMin = "temp_min"
        case tempMax = "temp_max"
        case pressure
        case seaLevel = "sea_level"
        case grndLevel = "grnd_level"
        case humidity
        case tempKf = "temp_kf"
    }
}

// MARK: - Rain
struct RainForecastModel: Codable {
    let the3H: Double

    enum CodingKeys: String, CodingKey {
        case the3H = "3h"
    }
}

// MARK: - Snow
struct SnowForecastModel: Codable {
    let the3H: Double

    enum CodingKeys: String, CodingKey {
        case the3H = "3h"
    }
}

// MARK: - Sys
struct SysForecastModel: Codable {
    let pod: String
}

// MARK: - Wind
struct WindForecastModel: Codable {
    let speed: Double
    let deg: Int
    let gust: Double
}
