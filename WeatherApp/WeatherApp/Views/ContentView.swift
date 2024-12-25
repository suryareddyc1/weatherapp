//
//  SearchView.swift
//  WeatherApp
//
//  Created by Surya Vummadi on 24/12/24.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel = WeatherViewModel()
    @State private var cityName = ""
    
    var body: some View {
        NavigationStack {
            HStack {
                TextField("Search for city", text: $cityName)
                    .padding()
                    .background(Color.white.opacity(0.1))
                    .cornerRadius(8)
                
                NavigationLink(destination: DetailWeatherView(cityName: cityName)) {
                    Text("Search")
                        .padding()
                        .background(cityName.isEmpty ? .black.opacity(0.4) : .black.opacity(0.8))
                        .foregroundColor(.white)
                        .cornerRadius(8)
                        .padding()
                }
                .navigationTitle("Weather")
                .disabled(cityName.isEmpty)
            }
            .padding(.vertical, 40)
            
            Spacer()
        }
    }
}
