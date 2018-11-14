//
//  Rover.swift
//  iPractice02
//
//  Created by Alumnos on 11/13/18.
//  Copyright © 2018 upc. All rights reserved.
//

import Foundation
import SwiftyJSON

class Rover {
    var id: Int
    var name: String
    var landing_date: String
    var launch_date: String
    var status: String
    var max_sol: Int
    var max_date: String
    var total_photos: Int
    
    init(id: Int,
        name: String,
        landing_date: String,
        launch_date: String,
        status: String,
        max_sol: Int,
        max_date: String,
        total_photos: Int
        ) {
        self.id = id
        self.name = name
        self.landing_date = landing_date
        self.launch_date = launch_date
        self.status = status
        self.max_sol = max_sol
        self.max_date = max_date
        self.total_photos = total_photos
    }
    
    convenience init(from jsonRover: JSON) {
        self.init(id: jsonRover["id"].intValue,
                  name: jsonRover["name"].stringValue,
                  landing_date: jsonRover["landing_date"].stringValue,
                  launch_date: jsonRover["launch_date"].stringValue,
                  status: jsonRover["status"].stringValue,
                  max_sol: jsonRover["max_sol"].intValue,
                  max_date: jsonRover["max_date"].stringValue,
                  total_photos: jsonRover["total_photos"].intValue)
    }
}
