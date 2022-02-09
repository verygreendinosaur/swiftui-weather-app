//
//  ContentView.swift
//  SwiftUI-Weather
//
//  Created by Primary User on 2/7/22.
//

import SwiftUI

// MARK: Main view

struct ContentView: View {
  @State private var isNight = false
  
  private var nextFiveDays = WeatherDay.getMockFiveDayWeather()
  
  var body: some View {
    ZStack {
      BackgroundView(isNight: isNight)
      VStack {
        CityView(city: "Bellevue", state: "WA")
        MainWeatherStatusView(imageName: isNight ? "moon.stars.fill" : "cloud.sun.fill", temp: 76)
        HStack(spacing: 20) {
          ForEach(nextFiveDays) { day in
            WeatherDayView(dayOfWeek: day.name, imageName: day.imageName, temp: day.temp)
          }
        }
        Spacer()
        Button("Change Day Time") {
          isNight.toggle()
        }
        .buttonStyle(WeatherButtonStyle())
        Spacer()
      }
    }
  }
}

// MARK: Subviews

struct WeatherDayView: View {
  var dayOfWeek: String
  var imageName: String
  var temp: Int
  
  var body: some View {
    VStack {
      Text(dayOfWeek)
        .font(.system(size: 16, weight: .medium, design: .default))
        .foregroundColor(.white)
      Image(systemName: imageName)
        .symbolRenderingMode(.multicolor)
        .resizable()
        .aspectRatio(contentMode: .fit)
        .frame(width: 40, height: 40)
      Text("\(temp)°")
        .font(.system(size: 28, weight: .medium))
        .foregroundColor(.white)
    }
  }
}

struct BackgroundView: View {
  var isNight: Bool
  
  var body: some View {
    LinearGradient(gradient: Gradient(colors: [isNight ? .black : .blue, isNight ? .gray : Color("CustomLightBlue")]), startPoint: .topLeading, endPoint: .bottomTrailing)
      .ignoresSafeArea()
  }
}

struct CityView: View {
  var city: String
  var state: String
  
  var body: some View {
    Text("\(city), \(state)")
      .font(.system(size: 32, weight: .medium, design: .default))
      .foregroundColor(.white)
      .padding()
  }
}

struct MainWeatherStatusView: View {
  var imageName: String
  var temp: Int
  
  var body: some View {
    VStack(spacing: 8) {
      Image(systemName: imageName)
        .renderingMode(.original)
        .resizable()
        .aspectRatio(contentMode: .fit)
        .frame(width: 180, height: 180)
      Text("\(temp)°")
        .font(.system(size: 70, weight: .medium))
        .foregroundColor(.white)
    }
    .padding(.bottom, 40)
  }
}

// MARK: Preview

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
      .preferredColorScheme(.dark)
  }
}
