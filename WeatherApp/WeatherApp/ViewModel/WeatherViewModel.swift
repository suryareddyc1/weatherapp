//
//  ViewModel.swift
//  WeatherApp
//
//  Created by Surya Vummadi on 23/12/24.
//

import Foundation
import SwiftUI

class WeatherViewModel: ObservableObject {
    @Published var weather: WeatherModel?
    @Published var weatherForecastList: [ListForecastModel] = []
    @Published var isLoading: Bool = false
    
    private let API_KEY = "552ff27319b52706cb413c5d2ced75da"
    
    func loadWeather(city: String) async {
        DispatchQueue.main.async {
            self.isLoading = true
        }
        
        do {
            let weatherInfoData = try await loadWeatherInfo(city: city)
            let weatherInfo = try JSONDecoder().decode(WeatherModel.self, from: weatherInfoData)
            
            let weatherForecastData = try await loadWeatherForecast(lat: "\(weatherInfo.coord.lat)", lon: "\(weatherInfo.coord.lon)")
            let forecastInfo = try JSONDecoder().decode(WeatherForecast.self, from: weatherForecastData)
            
            DispatchQueue.main.async {
                self.weather = weatherInfo
                self.weatherForecastList = forecastInfo.list
                self.isLoading = false
            }
        } catch {
            DispatchQueue.main.async {
                self.isLoading = false
            }
            print("Error: \(error.localizedDescription)")
        }
    }
    
    func loadWeatherInfo(city: String) async throws -> Data {
        let urlString = "https://api.openweathermap.org/data/2.5/weather?q=\(city)&appid=\(API_KEY)&units=metric"
        
        let (data, _) = try await URLSession.shared.data(from: URL(string: urlString)!)
        
        return data
    }
    
    func loadWeatherForecast(lat: String, lon: String) async throws -> Data {
        let urlString = "https://api.openweathermap.org/data/2.5/forecast?lat=\(lat)&lon=\(lon)&appid=\(API_KEY)&units=metric"
        
        let (data, _) = try await URLSession.shared.data(from: URL(string: urlString)!)
        
        return data
    }
}
