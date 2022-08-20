//
//  WeatherData.swift
//  Weatther App API Call
//
//  Created by Apple on 29/05/22.
//

import Foundation
struct WeatherData:Codable
{
    let location : LocationData
    let current : CurrentData
}
