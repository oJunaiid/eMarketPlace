//
//  Products.swift
//  eSewaMarket
//
//  Created by Omar  on 4/12/23.
//

import Foundation
import SwiftyJSON
import UIKit


struct Products {
    var id: Int?
    var title: String?
    var price: Double?
    var category: String?
    var description: String?
    var imageUrl: String?
    
    var rating: Rating?
    var rate: Double?
    var count: Int?
    
    init(id: Int, title: String, price:Int, category: String, description: String,  imageUrl: String, rating: Rating) {
            self.id = id
            self.title = title
            self.imageUrl = imageUrl
        self.price = Double(price)
        self.category = category
        self.description = description
        
        }
        
    init(json: JSON) {
        self.id = json["id"].int // for each property
        self.title = json["title"].string
        self.price = json["price"].double
        self.category = json["category"].string
        self.description = json["description"].string
        self.imageUrl = json["imageUrl"].string
        self.rating = Rating(json: json["rating"]) // for json
    }
}
            


struct Rating {
    var rate: Double?
    var count: Int?
    
    init(json: JSON) {
        self.rate = json["rate"].double
        self.count = json["count"].int
    }
}
