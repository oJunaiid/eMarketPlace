//
//  DescriptionTableViewCell.swift
//  eSewaMarket
//
//  Created by Omar  on 5/4/23.

import UIKit

class DescriptionTableViewCell: UITableViewCell {
    
    private let cellReuseIdentifier = "DescriptionTableViewCell"

    static let reuseIdentifier = "DescriptionTableViewCell"

    let tickImage: UIImageView = {
        let checkImage = UIImageView()
        checkImage.image = UIImage(systemName: "checkmark.circle.fill")
        checkImage.contentMode = .scaleAspectFit
        checkImage.clipsToBounds = true
        checkImage.translatesAutoresizingMaskIntoConstraints = false
        checkImage.tintColor = UIColor(red: 48/255, green: 219/255, blue: 65/255, alpha: 1.0)
        return checkImage
    }()
    
    let descriptionImage: UILabel = {
        let description = UILabel()
        description.translatesAutoresizingMaskIntoConstraints = false
        description.font = .systemFont(ofSize: 14, weight: .medium)
        description.textColor = .black
        description.numberOfLines = 10
        return description
    }()

    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
 
    func setupView() {
        self.selectionStyle = .none
        contentView.backgroundColor = .clear
        self.addSubview(tickImage)
        self.addSubview(descriptionImage)
        
        NSLayoutConstraint.activate([

            tickImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            tickImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            tickImage.widthAnchor.constraint(equalToConstant: 20),
            tickImage.heightAnchor.constraint(equalToConstant: 20),
            
            descriptionImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            descriptionImage.leadingAnchor.constraint(equalTo: tickImage.trailingAnchor, constant: 4),
            descriptionImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            descriptionImage.widthAnchor.constraint(equalToConstant: 310),
        ])
    }
    func configure(with model: ProductModel) {
        descriptionImage.text = model.description
      }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
