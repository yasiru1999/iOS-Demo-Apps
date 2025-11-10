//
//  WeatherManager.swift
//  Clima
//
//  Created by YASIRU JAYASEKARA on 2025-07-22.
//

import Foundation

struct WeatherManager {
    let weatherURL = "https://api.openweathermap.org/data/2.5/weather?appid=567d687c34f23ba862506e9365e99a80&units=metric"
    
    func fetchWeather(city: String) {
        let urlString = "\(weatherURL)&q=\(city)"
        performRequest(urlString: urlString)
    }
    
    func performRequest(urlString: String) {
        //1: Create a URL
        if let url = URL(string: urlString) {
            //2: Create a URLSession
            let urlSession = URLSession(configuration: .default)
            
            //3: Give URLSession a task
            let task = urlSession.dataTask(with: url) { data, response, error in
                if error != nil {
                    print(error!)
                    return
                }
                
                if let safeData = data {
                    self.parseJSON(weatherData: safeData)
                }
            }
            
            //4: Start the task
            task.resume()
        }
    }
    
    func parseJSON(weatherData: Data) {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(WeatherData.self, from: weatherData)
            let id = decodedData.weather[0].id
            let temp = decodedData.main.temp
            let name = decodedData.name
            
            let weather = WeatherModel(conditionID: id, cityName: name, temperature: temp)
            print(weather.conditionName)    
            weather.temperatureString
        } catch {
            print(error)
        }
    }
}
