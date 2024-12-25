//
//  ContentView.swift
//  WeatherApp
//
//  Created by Surya Vummadi on 23/12/24.
//

import SwiftUI

struct DetailWeatherView: View {
    @ObservedObject var viewModel = WeatherViewModel()
    @State private var searchTerm = ""
    
    var cityName: String
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color.green, Color.purple]),
                           startPoint: .top,
                           endPoint: .bottom)
            .edgesIgnoringSafeArea(.all)

            VStack {
                if viewModel.isLoading {
                    ProgressView("Loading...")
                        .progressViewStyle(CircularProgressViewStyle())
                } else if let weather = viewModel.weather {
                    CurrentTempView(weather: weather)
                    
                    Divider()
                    
                    ScrollView(.vertical, showsIndicators: false) {
                        VStack {
                            ForEach(viewModel.weatherForecastList, id: \.dt) { forecast in
                                ForecastRow(forecast: forecast)
                            }
                        }
                    }
                    Divider()
                    
                    Spacer()
                }
                else {
                    Text("No Data available. Please check your city name")
                        .foregroundStyle(.white)
                }
            }
            .task {
                await viewModel.loadWeather(city: cityName)
            }
        }
    }
}
