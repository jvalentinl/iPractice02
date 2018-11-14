//
//  Camera.swift
//  iPractice02
//
//  Created by Alumnos on 11/13/18.
//  Copyright © 2018 upc. All rights reserved.
//

import Foundation
import SwiftyJSON

class Camera {
    var id: Int
    var name: String
    var rover_id: Int
    var full_name: String
    
    init(id: Int,
        name: String,
        rover_id: Int,
        full_name: String
        ) {
        self.id = id
        self.name = name
        self.rover_id = rover_id
        self.full_name = full_name
    }
    convenience init(id: Int, name: String) {
        self.init(id: id, name: name, rover_id: 0, full_name: "")
    }
    convenience init(from jsonCamera: JSON) {
        self.init(id: jsonCamera["id"].intValue,
                  name: jsonCamera["name"].stringValue,
                  rover_id: jsonCamera["rover_id"].intValue,
                  full_name: jsonCamera["full_name"].stringValue)
    }
    //class func buildAll(from jsonCameras: [JSON]) -> [Camera] {
    //    let count = jsonCameras.count
     //   var
    //}
}
