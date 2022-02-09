//
//  WeatherDay.swift
//  SwiftUI-Weather
//
//  Created by Primary User on 2/7/22.
//

import Foundation

struct WeatherDay: Identifiable {
  // Don't do in a real app 😊
  var id: String { name }
  var name: String
  var imageName: String
  var temp: Int
}

extension WeatherDay {
  static func getMockFiveDayWeather() -> [WeatherDay] {
    [WeatherDay(name: "TUE", imageName: "cloud.sun.fill", temp: 74),
     WeatherDay(name: "WED", imageName: "sun.max.fill", temp: 88),
     WeatherDay(name: "THU", imageName: "wind.snow", temp: 55),
     WeatherDay(name: "FRI", imageName: "sunset.fill", temp: 60),
     WeatherDay(name: "SAT", imageName: "snow", temp: 25)]
  }
}
