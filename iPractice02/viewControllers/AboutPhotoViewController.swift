//
//  AboutPhotoViewController.swift
//  iPractice02
//
//  Created by Alumnos on 11/13/18.
//  Copyright © 2018 upc. All rights reserved.
//

import UIKit

class AboutPhotoViewController: UIViewController {
    @IBOutlet weak var aNameLabel: UILabel!
    @IBOutlet weak var aPictureImageView: UIImageView!
    @IBOutlet weak var aFullNameLabel: UILabel!
    @IBOutlet weak var aEarthDateLabel: UILabel!
    @IBOutlet weak var aRoverNameLabel: UILabel!
    @IBOutlet weak var aLandingDate: UILabel!
    @IBOutlet weak var aLaunchDateLabel: UILabel!
    @IBOutlet weak var aStatusLabel: UILabel!
    @IBOutlet weak var aMaxDateLabel: UILabel!
    @IBOutlet weak var aTotalPhotosLabel: UILabel!
    
    var myAboutPhoto: Photo?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        if let myPhoto = myAboutPhoto {
            aNameLabel.text = myPhoto.camera.name
            aFullNameLabel.text = myPhoto.camera.full_name
            aEarthDateLabel.text = myPhoto.earthDate
            aRoverNameLabel.text = myPhoto.rover.name
            aLandingDate.text = myPhoto.rover.landing_date
            aLaunchDateLabel.text = myPhoto.rover.launch_date
            aStatusLabel.text = myPhoto.rover.status
            aMaxDateLabel.text = myPhoto.rover.max_date
            aTotalPhotosLabel.text = String(describing: myPhoto.rover.total_photos)
            if let urlPhoto = URL(string: myPhoto.imgSrc) {
                aPictureImageView.af_setImage(withURL: urlPhoto)
            }
        }
    }
    

    @IBAction func doneActionPhoto(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true)
    }
   

}
