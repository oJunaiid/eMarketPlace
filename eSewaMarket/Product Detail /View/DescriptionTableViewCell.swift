//
//  DescriptionTableViewCell.swift
//  eSewaMarket
//
//  Created by Omar  on 5/4/23.
//

import UIKit

class DescriptionTableViewCell: UITableViewCell {

    private let cellReuseIdentifier = "DescriptionTableViewCell"
    
    static let reuseIdentifier = "DescriptionTableViewCell"
    
    
    
    let stackView: UIStackView = {
           let stackView = UIStackView()
           stackView.axis = .vertical
           stackView.spacing = 8.0
        
           return stackView
       }()
       
       override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
           super.init(style: style, reuseIdentifier: reuseIdentifier)
           
           
           contentView.addSubview(stackView)
           stackView.translatesAutoresizingMaskIntoConstraints = false
           stackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0).isActive = true
           stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16.0).isActive = true
           stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16.0).isActive = true
           stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8.0).isActive = true
           
           for _ in 1...7 {
                 addRandomDescription()
       }
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
     func addRandomDescription() {
        let tickImage = UIImageView(image: UIImage(systemName: "checkmark.circle.fill"))
        tickImage.tintColor = .systemGreen
        tickImage.translatesAutoresizingMaskIntoConstraints = false
        
        
        let descriptionLabel = UILabel()
        descriptionLabel.numberOfLines = 2
        descriptionLabel.font = .systemFont(ofSize: 14.0)
        descriptionLabel.text = randomDescription()
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false

        let arrangedSubviews = [tickImage, descriptionLabel]
        stackView.addArrangedSubview(UIStackView(arrangedSubviews: arrangedSubviews))
    }
//
    private func randomDescription() -> String {
        let descriptions = [
            "The item is a great Bag",
            "This is a high-quality Bag",
            "The Bag is comfortable and stylish",
            "The Bag is perfect for everyday use",
            "These Bag is made of premium quality",
            "The Bag is a timeless classic",
        ]
        let randomIndex = Int.random(in: 0..<descriptions.count)
        return descriptions[randomIndex]
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
          // Do not call super implementation to prevent highlighting
      }
}
