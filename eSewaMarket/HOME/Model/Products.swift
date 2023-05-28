//
//  Products.swift
//  eSewaMarket
//
//  Created by Omar  on 4/12/23.

import SwiftyJSON
import UIKit

class ProductModel {
    var id: Int?
    var title: String?
    var price: Double?
    var category: String?
    var description: String?
    var image: String?

    var rating: Rating?

    init(title: String?, price: Double?, category: String?, image: String?, description: String?) {
        self.title = title
        self.price = price
        self.category = category
        self.image = image
        self.description = description
    }
    
    init(json: JSON) {

        self.id = json["id"].int
        self.title = json["title"].string
        self.price = json["price"].double
        self.category = json["category"].string
        self.image = json["image"].string
        self.description = json["description"].string
    
//        if let category = json["category"].string {
//            switch category {
//            case "electronics":
//                self.category = Category.electronics.rawValue
//            case "jewelery":
//                self.category = Category.jewelery.rawValue
//            case "men's clothing":
//                self.category = Category.menSClothing.rawValue
//            case "women's clothing":
//                self.category = Category.womenSClothing.rawValue
//            default:
//                self.category = nil
//            }
//        } else {
//            self.category = nil
//           }
       }
    }

struct CategorieModel {
    var category: String?
    var imageName: UIImage?
}
//    init(category: String?) {
//    self.category = category
//    }
//
//    init(json: JSON) {
//        self.category = json["category"].string
//    }


////
//enum Category: String {
//    case electronics
//    case jewelery
//    case menSClothing = "men's clothing"
//    case womenSClothing = "women's clothing"
//
//    init?(stringValue: String) {
//        switch stringValue {
//        case "electronics":
//            self = .electronics
//        case "jewelery":
//            self = .jewelery
//        case "men's clothing":
//            self = .menSClothing
//        case "women's clothing":
//            self = .womenSClothing
//        default:
//            return nil
//        }
//    }
//
//    var stringValue: String {
//        return self.rawValue
//    }



//    enum CodingKeys: String, CodingKey {
//            case id
//            case title
//            case price
//            case category
//            case description
//            case image
//            case rating
//        }
//
//        required init(from decoder: Decoder) throws {
//            let values = try decoder.container(keyedBy: CodingKeys.self)
//            id = try values.decodeIfPresent(Int.self, forKey: .id)
//            title = try values.decodeIfPresent(String.self, forKey: .title)
//            price = try values.decodeIfPresent(Double.self, forKey: .price)
//            category = try values.decodeIfPresent(String.self, forKey: .category)
//            description = try values.decodeIfPresent(String.self, forKey: .description)
//            image = try values.decodeIfPresent(String.self, forKey: .image)
//            rating = try values.decodeIfPresent(Rating.self, forKey: .rating)
//        }
//    }

struct Rating: Decodable {
    var rate: Double?
    var count: Int?
}
//
//    enum CodingKeys: String, CodingKey {
//        case rate
//        case count
//    }
//
//    init(from decoder: Decoder) throws {
//        let values = try decoder.container(keyedBy: CodingKeys.self)
//        rate = try values.decodeIfPresent(Double.self, forKey: .rate)
//        count = try values.decodeIfPresent(Int.self, forKey: .count)
//    }
//}

//enum Category: String {
//    case electronics = "electronics"
//    case jewelery = "jewelery"
//    case menSClothing = "men's clothing"
//    case womenSClothing = "women's clothing"
//}

struct BannerImage {
    var image: UIImage?
}
