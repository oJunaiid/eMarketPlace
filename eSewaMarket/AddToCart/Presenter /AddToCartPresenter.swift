//
//  AddToCartPresenter.swift
//  eSewaMarket
//
//  Created by Omar  on 5/7/23.
//

import UIKit

protocol AddToCartProtocol: NSObject {
    func displayItemList(model: [AddCartModel])

}
class AddCartItemPresenter {

    var items = [AddCartModel(itemName: "Computer", itemDesc: "HP", itemPrice: 3000, itemImage: UIImage(named: "com"), totalItemCount: 1), AddCartModel(itemName: "Laptop", itemDesc: "Macbook", itemPrice: 3000, itemImage: UIImage(named: "computerImage"), totalItemCount: 1), AddCartModel(itemName: "Airpod", itemDesc: "Airpod Max", itemPrice: 3000, itemImage: UIImage(named: "max"), totalItemCount: 1)]


    var delegate: AddToCartProtocol?

    weak var view: AddToCartViewController?

    init(view: AddToCartViewController, delegate: AddToCartProtocol) {
        self.delegate = delegate
        self.view = view

    }

    func populateTableView() {
        self.delegate?.displayItemList(model: items)
    }

}
