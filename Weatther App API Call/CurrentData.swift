//
//  CurrentData.swift
//  Weatther App API Call
//
//  Created by Apple on 29/05/22.
//

import Foundation
struct CurrentData:Codable
{
    let last_updated : String
    let temp_c : Float
    let wind_kph : Float
    let humidity : Int
    
    
}
