//
//  ImageDescriptionViewCell.swift
//  eSewaMarket
//
//  Created by Omar  on 5/3/23.
//

import UIKit

class ImageDescriptionViewCell: UITableViewCell {
        
        private let cellReuseIdentifier = "ImageDescriptionViewCell"
        
        static let reuseIdentifier = "ImageDescriptionViewCell"

        private let containerView: UIView = {
            let containerView = UIView()
            containerView.translatesAutoresizingMaskIntoConstraints = false
            containerView.backgroundColor = .white
            return containerView

        }()
 
         let descriptionLabel: UILabel = {
            let title = UILabel()
//            title.text = "Jacket"
            title.font = UIFont.systemFont(ofSize: 24, weight: .semibold)
            title.textColor = .black
            title.translatesAutoresizingMaskIntoConstraints = false
             title.numberOfLines = 2 
            return title
    }()
     let priceLabel: UILabel = {
        let price = UILabel()
//        price.text = "Rs.3000"
        price.font = UIFont.systemFont(ofSize: 20, weight: .regular)
        price.textColor = .black
        price.translatesAutoresizingMaskIntoConstraints = false
        
        return price
}()

    let discountedPrice: UILabel = {
        let previousPrice = UILabel()
        previousPrice.text = "$10.90"
        previousPrice.font = UIFont.systemFont(ofSize: 14, weight: .regular)

        let attributedString = NSMutableAttributedString(string: previousPrice.text ?? "")
        attributedString.addAttribute(NSAttributedString.Key.strikethroughStyle, value: 2, range: NSMakeRange(0, attributedString.length))

        previousPrice.attributedText = attributedString
        previousPrice.translatesAutoresizingMaskIntoConstraints = false
        
        return previousPrice
    }()
    

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(containerView)
        containerView.backgroundColor = .clear

        containerView.addSubview(descriptionLabel)
        containerView.addSubview(priceLabel)
        containerView.addSubview(discountedPrice)



        NSLayoutConstraint.activate([


            containerView.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 0),
            containerView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: 2),
            containerView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: 2),
            containerView.heightAnchor.constraint(equalToConstant: 80),


            descriptionLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 10),
            descriptionLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 16),
            descriptionLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -10),


            priceLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 0),
            priceLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 16),
            priceLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -5),
//            priceLabel.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -10),
            
            discountedPrice.topAnchor.constraint(equalTo: priceLabel.bottomAnchor, constant: 2),
            discountedPrice.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
        ])
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
          // Do not call super implementation to prevent highlighting
      }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


