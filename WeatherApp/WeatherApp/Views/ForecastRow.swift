//
//  DayRow.swift
//  WeatherApp
//
//  Created by Surya Vummadi on 24/12/24.
//

import SwiftUI

struct ForecastRow: View {
    var forecast: ListForecastModel

    var body: some View {
        HStack {
            Text(formatDateString(forecast.dtTxt))
                .foregroundStyle(.white)
            Spacer()
            Text(String(format: "%.0f", forecast.main.temp))
                .foregroundStyle(.white)
            
            Spacer()
            Text(String(format: "L: %.0f", forecast.main.tempMin))
                .foregroundStyle(.white)

            Text(String(format: "H: %.0f", forecast.main.tempMax))
                .foregroundStyle(.white)
        }
        .padding()
    }
    
    // MARK: private methods
    private func formatDateString(_ dateString: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        
        guard let date = dateFormatter.date(from: dateString) else {
            return "Invalid date"
        }
        
        dateFormatter.dateFormat = "dd MMM HH:mm" // ex: 12 Dec 13:00
        
        return dateFormatter.string(from: date)
        
    }
}

