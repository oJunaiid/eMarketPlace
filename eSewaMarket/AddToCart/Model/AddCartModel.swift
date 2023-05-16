//
//  AddCartModel.swift
//  eSewaMarket
//
//  Created by Omar  on 5/4/23.
//

import Foundation
import UIKit

struct AddCartModel {
    var itemName: String?
    var itemDesc: String?
    var itemPrice: Double?
    var itemImage: UIImage?
    var totalItemCount: Int?
}


//    init(json: JSON) {
//        self.id = json["id"].int // for each property
//        self.title = json["title"].string
//        self.price = json["price"].double
//        self.category = json["category"].string
//        self.description = json["description"].string
////        self.imageUrl = json["imageUrl"].string
//        self.rating = Rating(json: json["rating"]) // for json
    
