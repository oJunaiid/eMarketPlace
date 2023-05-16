//
//  Products.swift
//  eSewaMarket
//
//  Created by Omar  on 4/12/23.

import Foundation
import SwiftyJSON
import UIKit

class ProductModel: Decodable {
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

    enum CodingKeys: String, CodingKey {
        case id
        case title
        case price
        case category
        case description
        case image
        case rating
    }

    required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        title = try values.decodeIfPresent(String.self, forKey: .title)
        price = try values.decodeIfPresent(Double.self, forKey: .price)
        category = try values.decodeIfPresent(String.self, forKey: .category)
        description = try values.decodeIfPresent(String.self, forKey: .description)
        image = try values.decodeIfPresent(String.self, forKey: .image)
        rating = try values.decodeIfPresent(Rating.self, forKey: .rating)
    }
}

struct Rating: Decodable {
    var rate: Double?
    var count: Int?

    enum CodingKeys: String, CodingKey {
        case rate
        case count
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        rate = try values.decodeIfPresent(Double.self, forKey: .rate)
        count = try values.decodeIfPresent(Int.self, forKey: .count)
    }
}

enum Category: String, Codable {
    case electronics = "electronics"
    case jewelery = "jewelery"
    case menSClothing = "men's clothing"
    case womenSClothing = "women's clothing"
}

struct BannerImage {
    var image: UIImage?
}
