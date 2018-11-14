//
//  Photo.swift
//  iPractice02
//
//  Created by Alumnos on 11/13/18.
//  Copyright © 2018 upc. All rights reserved.
//

import Foundation
import SwiftyJSON

class Photo{
    var id: Int
    var sol: Int
    var camera : Camera
    var imgSrc: String
    var earthDate: String
    var rover : Rover
    
    init(id: Int,
        sol: Int,
        camera : Camera,
        imgSrc: String,
        earthDate: String,
        rover: Rover
        ) {
        self.id = id
        self.sol = sol
        self.camera = camera
        self.imgSrc = imgSrc
        self.earthDate = earthDate
        self.rover = rover
    }
    convenience init(from jsonPhoto: JSON) {
        self.init(id: jsonPhoto["id"].intValue,
                  sol: jsonPhoto["sol"].intValue,
                  camera: Camera(from: JSON(jsonPhoto["camera"])),
                  imgSrc: jsonPhoto["img_src"].stringValue,
                  earthDate: jsonPhoto["earth_date"].stringValue,
                  rover: Rover(from: JSON(jsonPhoto["rover"]))
                  )
    }
    
    class func buildAll(jsonPhotos: [JSON]) -> [Photo] {
        let count = jsonPhotos.count
        var photos: [Photo] = []
        for i in 0 ..< count {
            photos.append(Photo(from: JSON(jsonPhotos[i])))
        }
        return photos
    }
}
