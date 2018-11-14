//
//  RoverEyesViewController.swift
//  iPractice02
//
//  Created by Alumnos on 11/13/18.
//  Copyright © 2018 upc. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage
import SwiftyJSON

private let reuseIdentifier = "Cell"

class MyCeldaRovers: UICollectionViewCell {
    
    @IBOutlet weak var pictureRoverImageView: UIImageView!
    @IBOutlet weak var fullNameRoverLabel: UILabel!
    
    func updateViewRoverData(from photo: Photo) {
        fullNameRoverLabel.text = photo.camera.full_name
        if let urlImage = URL(string: photo.imgSrc) {
            pictureRoverImageView.af_setImage(withURL: urlImage, placeholderImage: UIImage(named: "No_Image_Available"))
        }
    }
}

class RoverEyesViewController: UICollectionViewController {
    var photos: [Photo] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateDataPhotos()
    }

    func updateDataPhotos(){
        
        Alamofire.request(NasaApi.basePhotoUrl)
            .validate()
            .responseJSON(completionHandler: {
                response in
                switch response.result {
                case .success(let value):
                    let json = JSON(value)
                    //let status = json["status"].stringValue
                    //if status == "error" {
                    //    print("Tutor Api Error: \(json["message"].stringValue)")
                    //    return
                    //}
                    let jsonPhotos = json["photos"].arrayValue
                    self.photos = Photo.buildAll(jsonPhotos: jsonPhotos)
                    self.collectionView!.reloadData()
                case .failure(let error):
                    print("Response Error: \(error.localizedDescription)")
                }
            })
    }

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return photos.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! MyCeldaRovers
    
        // Configure the cell
        cell.updateViewRoverData(from: photos[indexPath.row])
        return cell
    }

    
    
   // to about photo
    
    var currentItemPhoto: Int = 0
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowPhotoMars" {
            let aboutPhotoRoverViewController = (segue.destination as! UINavigationController).viewControllers.first as! AboutPhotoViewController
            aboutPhotoRoverViewController.myAboutPhoto = photos[currentItemPhoto]
        }
    }
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        currentItemPhoto = indexPath.row
        self.performSegue(withIdentifier: "ShowPhotoMars", sender: self)
    }

}
