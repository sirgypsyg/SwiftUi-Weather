//
//  ContentView.swift
//  SwiftUi-Weather
//
//  Created by Kuba on 31/12/2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            BackgroundView()
            VStack{
                CityTextView(cityCountry: "Warszawa, PL", imageName: "cloud.sun.fill", temperature: 12)
                
                Spacer()
                HStack(spacing: 20){
                    WeatherDayView(dayOfWeek: "Mon", imageName: "cloud.sun.fill", temperature: 12)
                    WeatherDayView(dayOfWeek: "Tue", imageName: "cloud.fill", temperature: 11)
                    WeatherDayView(dayOfWeek: "Wen", imageName: "sun.haze.fill", temperature: 44)
                    WeatherDayView(dayOfWeek: "Thu", imageName: "sun.max.fill", temperature: 22)
                    WeatherDayView(dayOfWeek: "Thu", imageName: "moon.fill", temperature: 14)
                }
                Spacer()
                
                Button {
                print("tapped")
                } label: {
                    WeatherButton(title: "Change region",
                                  textColor: .blue,
                                  backgroundColor: .white)
                }
                                    
                
                Spacer()
            }
        }
    }
}


#Preview {
    ContentView()
}

struct WeatherDayView: View {
    
    var dayOfWeek: String
    var imageName: String
    var temperature: Int
    
    var body: some View {
        VStack{
            Text(dayOfWeek)
                .font(.system(size: 20, weight: .medium))
                .foregroundColor(.white)
            
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 55, height: 55)
            
            Text("\(temperature)°")
                .font(.system(size: 20, weight: .medium))
                .foregroundColor(.white)
        }
    }
}

struct BackgroundView: View {
    
    var body: some View {
        LinearGradient(gradient:
                        Gradient(colors: [Color.blue, Color("LightBlue")]), startPoint: .topLeading,
                       endPoint: .bottomTrailing)
        .ignoresSafeArea()
    }
}


struct CityTextView: View {
    
    var cityCountry: String
    var imageName: String
    var temperature: Int
    
    var body: some View {
        VStack(spacing: 8){
            Text(cityCountry)
                .font(.system(size: 32, weight: .medium, design: .default))
                .foregroundColor(.white)
                .padding()
            
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180, height: 180)
            
            Text("\(temperature)°")
                .font(.system(size: 70, weight: .medium))
                .foregroundColor(.white)
        }.padding(.bottom, 20)
    }
}

//this is a test
