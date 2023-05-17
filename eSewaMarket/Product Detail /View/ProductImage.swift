//
//  ProductImage.swift
//  eSewaMarket
//
//  Created by Omar  on 5/3/23.


import UIKit

class ProductImage: UITableViewCell {
    
    private let cellReuseIdentifier = "ProductImage"
    
    static let reuseIdentifier = "ProductImage"

    private let containerView: UIView = {
        let containerView = UIView()
        containerView.translatesAutoresizingMaskIntoConstraints = false
        containerView.backgroundColor = .white
        return containerView
        
    }()
     let productImage: UIImageView = {
        let image = UIImageView(image: UIImage(named: ""))
        image.contentMode = .scaleAspectFill
        image.translatesAutoresizingMaskIntoConstraints = false
        
        return image
}()

override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    contentView.addSubview(containerView)
    containerView.addSubview(productImage)
   
    contentView.backgroundColor = .white
    
    NSLayoutConstraint.activate([
        
        
        containerView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0),
        containerView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 0),
        containerView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: 0),
        containerView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: 0),
        
        productImage.topAnchor.constraint(equalTo: containerView.topAnchor,constant: 0),
        productImage.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: 0),
        productImage.bottomAnchor.constraint(equalTo: containerView.bottomAnchor,constant: 0),
        productImage.leadingAnchor.constraint(equalTo: containerView.leadingAnchor,constant: 0),
        productImage.heightAnchor.constraint(equalTo: containerView.widthAnchor, multiplier: 1.1),
        productImage.widthAnchor.constraint(equalTo: containerView.widthAnchor)
        
        

    ])
    
}
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}




//
//
