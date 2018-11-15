//
//  CountriesViewController.swift
//  iPractice02
//
//  Created by ALEXIS-PC on 11/15/18.
//  Copyright © 2018 upc. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage
import SwiftyJSON

private let reuseIdentifier = "Cell"

class MyCountryCell: UICollectionViewCell {
    @IBOutlet weak var flagCountryImageView: UIImageView!
    @IBOutlet weak var nameCountryLabel: UILabel!
    
    func updateViewCountryData(from country: Country) {
        nameCountryLabel.text = country.name
        if let urlImage = URL(string: country.flag) {
            flagCountryImageView.af_setImage(withURL: urlImage, placeholderImage: UIImage(named: "No_Image_Available"))
        }
    }
}

class CountriesViewController: UICollectionViewController {
    
    var countries: [Country] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

       updateDataCountry()
    }

    func updateDataCountry(){
        
        Alamofire.request(NasaApi.baseCountryUrl)
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
                    let jsonCountries = json[""].arrayValue
                    self.countries = Country.buildAll(jsonCountries: jsonCountries)
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
        return countries.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! MyCountryCell
    
        // Configure the cell
        cell.updateViewCountryData(from: countries[indexPath.row])
        return cell
    }

    

}
