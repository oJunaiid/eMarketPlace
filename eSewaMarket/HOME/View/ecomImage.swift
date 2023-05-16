//
//  ecomImage.swift
//  eSewaMarket
//
//  Created by Omar  on 4/27/23.

import UIKit

class ImageCell: UITableViewCell {
    static let reuseIdentifier = "ImageCell"

    private let cellImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupSubviews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupSubviews() {
        contentView.addSubview(cellImageView)
        
        // Add Auto Layout constraints for the image view
        NSLayoutConstraint.activate([
            cellImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0),
            cellImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 15),
            cellImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0),
            cellImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0),
            cellImageView.heightAnchor.constraint(equalToConstant: 150)
        ])
    }
    
    func configure(with image: UIImage?) {
        if let image = image {
            cellImageView.image = image
        } else {
            // Handle the case where the image is nil
            cellImageView.image = UIImage(named: "ecom")
        }
    }
}
