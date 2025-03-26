//
//  WeatherView.swift
//  Weather App
//
//  Created by Jeevan Ramakichenin on 20/03/2025.
//

import SwiftUI

struct WeatherView: View {
    var weater: ResponseBody
    
    var body: some View {
        ZStack(alignment: .leading) {
            VStack {
                VStack(alignment: .leading, spacing: 5) {
                    Text(weater.name)
                        .bold().font(.title)
                    Text("Today, \(Date().formatted(.dateTime.month().day().hour().minute()))")
                        .fontWeight(.light)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                
                Spacer()
                
                VStack {
                    HStack{
                        VStack(spacing: 20) {
                            Image(systemName: "sun.max")
                                .font(.system(size: 40))
                            Text(weater.weather[0].main)
                        }
                        .frame(width: 150, alignment: .leading )
                        
                        Spacer()
                        
                        Text(weater.main.feelsLike.roundDouble() + "°" )
                            .font(.system(size: 100))
                            .fontWeight(.bold)
                            .padding()
                    }
                    Spacer()
                        .frame(height: 30)
                    
                    AsyncImage(url: URL(string: "https://cdn.pixabay.com/photo/2020/01/24/21/33/city-4791269_960_720.png")) { image in
                                            image
                                                .resizable()
                                                .aspectRatio(contentMode: .fit)
                                                .frame(width: 350)
                                        } placeholder: {
                                            ProgressView()
                                        }
                    Spacer() 

                }
                
                .frame(maxWidth: .infinity, alignment: .trailing)
            }
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
            
            VStack{
                Spacer()
                
                VStack(alignment: .leading, spacing: 20) {
                    Text("Weather now")
                        .bold().padding(.bottom)
                    
                    HStack {
                        WeatherRow(logo: "thermometer", name: "min temp", value: weater.main.tempMin.roundDouble() + "°")
                        Spacer()
                        WeatherRow(logo: "thermometer", name: "max temp", value: weater.main.tempMax.roundDouble() + "°")
                    }
                    
                    HStack {
                        WeatherRow(logo: "wind", name: "wind speed", value: weater.wind.speed.roundDouble() + "m/s")
                        Spacer()
                        WeatherRow(logo: "humidity", name: "humidity", value: weater.main.humidity.roundDouble() + "%")
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
                .padding(.bottom, 20)
                .padding(.horizontal, 10)
                .foregroundColor(Color(hue: 0.656, saturation: 0.787, brightness: 0.354))
                .background(.white)
                .cornerRadius(20, corners: [.topLeft, .topRight])
            }
            
        }
        .edgesIgnoringSafeArea(.bottom)
        .background(Color(hue: 0.656, saturation: 0.787, brightness: 0.354))
        .preferredColorScheme(.dark)
    }
}
   
#Preview {
    WeatherView(weater: previewWeather)
}
