//
//  WeatherAppTests.swift
//  WeatherAppTests
//
//  Created by Surya Vummadi on 23/12/24.
//

import XCTest
@testable import WeatherApp

class ViewModelTests: XCTestCase {
    var viewModel: WeatherViewModel!

    override func setUp() {
        super.setUp()
        viewModel = WeatherViewModel()
    }

    override func tearDown() {
        viewModel = nil
        super.tearDown()
    }

    /// Tests successful loading of weather information for a given city.
    func testLoadWeatherSuccess() async throws {
        let expectedCity = "Hyderabad"
        
        let data = try await viewModel.loadWeatherInfo(city: expectedCity)
        let weatherModel = try JSONDecoder().decode(WeatherModel.self, from: data)

        XCTAssertEqual(weatherModel.name, expectedCity, "The city name in the weather model should match the expected city.")
    }

    /// Tests that the latitude and longitude values return the correct weather forecast for a given city.
    func testLatAndLonValue() async throws {
        let expectedCity = "Chennai"
        let latitude = "13.0878"
        let longitude = "80.2785"
        
        let data = try await viewModel.loadWeatherForecast(lat: latitude, lon: longitude)
        let forecastModel = try JSONDecoder().decode(WeatherForecast.self, from: data)
        
        XCTAssertNotNil(data, "Data should not be nil.")
        XCTAssertEqual(forecastModel.city.name, expectedCity, "The city name in the forecast model should match the expected city.")
    }

    /// Tests the behavior when loading weather information fails.
    func testLoadWeatherFailure() async {
        let invalidCity = "Hyderaabad"

        await viewModel.loadWeather(city: invalidCity)

        XCTAssertNil(viewModel.weather, "Weather should be nil on failure.")
        XCTAssertFalse(viewModel.isLoading, "Loading state should be false after a failed request.")
    }
}
