//
//  ContentView.swift
//  SwiftUi-Weather
//
//  Created by Kuba on 31/12/2023.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isNight = false
    
    var body: some View {
        ZStack {
            BackgroundView(isNight: isNight)
            
            VStack{
                CityTextView(cityCountry: "Warszawa, PL", imageName:  isNight ? "cloud.sun.fill" : "moon.star.fill", temperature: 12)
                
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
                    isNight.toggle()
                } label: {
                    WeatherButton(title: "Change DayTime",
                                  textColor: .blue,
                                  backgroundColor: .white)
                }
                                    
                
                Spacer()
            }
        }.onAppear{
            
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
    
    var isNight: Bool

    var body: some View {
        ContainerRelativeShape()
            .fill(isNight ? Color.black.gradient : Color.blue.gradient)
            .ignoresSafeArea()    }
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

