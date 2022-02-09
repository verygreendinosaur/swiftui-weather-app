//
//  ButtonStyles.swift
//  SwiftUI-Weather
//
//  Created by Primary User on 2/7/22.
//

import SwiftUI

struct WeatherButtonStyle: ButtonStyle {
  func makeBody(configuration: Configuration) -> some View {
    configuration.label
      .foregroundColor(.blue)
      .frame(width: 200, height: 50)
      .background(Color.white)
      .font(.system(size: 20, weight: .bold, design: .default))
      .cornerRadius(10)
  }
}
