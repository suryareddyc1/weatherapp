//
//  CurrentTempView.swift
//  WeatherApp
//
//  Created by Surya Vummadi on 24/12/24.
//

import SwiftUI

struct CurrentTempView: View {
    var weather: WeatherModel

    var body: some View {
        Text(weather.name)
            .font(.title2)
            .foregroundStyle(.white)

        Text(String(format: "%.0f", weather.main.temp))
            .font(.largeTitle)
            .foregroundStyle(.white)
        
        Text(weather.weather.first?.main ?? "-")
            .foregroundStyle(.white)
    }
}
