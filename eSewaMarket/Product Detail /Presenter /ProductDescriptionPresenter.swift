//
//  ProductDescriptionPresenter.swift
//  eSewaMarket
//
//  Created by Omar  on 5/7/23.
//

import Foundation
import UIKit

protocol ProductDescriptionProtocol: NSObject {
    
    func displayProductDescription(model: [ProductDescriptionModel])

}

class ProductInfoPresenter {
    var description = [ProductDescriptionModel(itemName: "Nothing Phone", itemPrice: 70000, itemImage: UIImage(named: "as"))]
 
    var delegate: ProductDescriptionProtocol?
    
    weak var view: ProductDetails?
    
    init(view: ProductDetails, delegate: ProductDescriptionProtocol) {
        self.delegate = delegate
        self.view = view
    }
    
    func populateDescriptionView() {
        self.delegate?.displayProductDescription(model: description)
    }

}
