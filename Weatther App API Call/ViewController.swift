//
//  ViewController.swift
//  Weatther App API Call
//
//  Created by Apple on 29/05/22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var humidityLabel: UILabel!
    @IBOutlet weak var wind: UILabel!
    @IBOutlet weak var tempretureLabel: UILabel!
    @IBOutlet weak var countryLable: UILabel!
    @IBOutlet weak var updateTimetable: UILabel!
    @IBOutlet weak var regionLable: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchData()
    }
    
    @IBAction func refreshButtonClicked(_ sender: UIButton) {
        fetchData()
    }
    
    func fetchData()
        {
            let url = URL(string: "https://api.weatherapi.com/v1/current.json?key=65a7aea3e395474187a20653220504&q=india&aqi=no")
            let dataTask = URLSession.shared.dataTask(with: url!, completionHandler: {
                (data, response, error) in
                guard let data = data, error == nil else
                {
                    print("Error Occurd While Accessing Data with URL")
                    return
                }
                var fullWeatherData : WeatherData?
                do
                {
                    fullWeatherData = try JSONDecoder().decode(WeatherData.self, from: data)
                    
                }
                catch
                {
                    print(" Error Occurd While JSON into swift structure \(error)")
                    
                }
                DispatchQueue.main.async {
                    self.updateTimetable.text = "Updated : \(fullWeatherData!.current.last_updated)"
                    self.regionLable.text = "Region : \(fullWeatherData!.location.region)"
                    self.countryLable.text = "Country : \(fullWeatherData!.location.country)"
                    self.tempretureLabel.text = "Tempreture : \(fullWeatherData!.current.temp_c)"
                    self.humidityLabel.text = "Humidity : \(fullWeatherData!.current.humidity)"
                    self.wind.text = "Wind (km/hr) : \(fullWeatherData!.current.wind_kph)"
                    self.view.layoutIfNeeded()
                }
                
            })
            dataTask.resume()
}
    
}

