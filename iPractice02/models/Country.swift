//
//  Country.swift
//  iPractice02
//
//  Created by ALEXIS-PC on 11/15/18.
//  Copyright © 2018 upc. All rights reserved.
//

import Foundation
import SwiftyJSON

class Country {
    var name: String
    var capital: String
    var flag: String
    
    init(name: String,
        capital: String,
        flag: String) {
        self.name = name
        self.capital = capital
        self.flag = flag
    }
    convenience init(from jsonCountry: JSON) {
        self.init(name: jsonCountry["name"].stringValue,
                  capital: jsonCountry["capital"].stringValue,
                  flag: jsonCountry["flag"].stringValue)
    }
    
    
    class func buildAll(jsonCountries: [JSON]) -> [Country] {
        let count = jsonCountries.count
        var countries: [Country] = []
        for i in 0 ..< count {
            countries.append(Country(from: JSON(jsonCountries[i])))
        }
        return countries
    }
}
