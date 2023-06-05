//
//  Products.swift
//  eSewaMarket
//
//  Created by Omar  on 4/12/23.

import SwiftyJSON
import UIKit

struct ProductModel {
    var id: Int?
    var title: String?
    var price: Double?
    var updatedPrice: Double?
    var category: String?
    var description: String?
    var image: String?
    var count: Int = 1 
    
    var rating: Rating?

    init(title: String?, price: Double?, category: String?, image: String?, description: String?) {
        self.title = title
        self.price = price
        self.updatedPrice = price
        self.category = category
        self.image = image
        self.description = description
    }
    
    init(json: JSON) {

        self.id = json["id"].int
        self.title = json["title"].string
        self.price = json["price"].double
        self.updatedPrice = json["price"].double
        self.category = json["category"].string
        self.image = json["image"].string
        self.description = json["description"].string
    
       }
    }

struct CategorieModel {
    var category: String?
    var imageName: UIImage?
}

struct Rating: Decodable {
    var rate: Double?
    var count: Int?
}


struct BannerImage {
    var image: UIImage?
}
