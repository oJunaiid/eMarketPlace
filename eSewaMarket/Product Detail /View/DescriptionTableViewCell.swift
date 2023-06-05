//
//  DescriptionTableViewCell.swift
//  eSewaMarket
//
//  Created by Omar  on 5/4/23.

import UIKit
import ReadMoreTextView

class DescriptionTableViewCell: UITableViewCell {
    
    private let cellReuseIdentifier = "DescriptionTableViewCell"
    
    static let reuseIdentifier = "DescriptionTableViewCell"
    
    let tickImage: UIImageView = {
        let checkImage = UIImageView()
        checkImage.image = UIImage(systemName: "checkmark.circle.fill")
        checkImage.contentMode = .scaleAspectFit
        //        checkImage.clipsToBounds = true
        checkImage.translatesAutoresizingMaskIntoConstraints = false
        checkImage.tintColor = UIColor(red: 48/255, green: 219/255, blue: 65/255, alpha: 1.0)
        return checkImage
    }()
    
    
    
    let descriptionLabel: ReadMoreTextView = {
        let description = ReadMoreTextView()
        description.translatesAutoresizingMaskIntoConstraints = false
        description.font = .systemFont(ofSize: 14, weight: .medium)
        description.textColor = .black
//        description.numberOfLines = 10
        description.backgroundColor = .clear
        
        description.shouldTrim = true
        description.maximumNumberOfLines = 4
        description.attributedReadMoreText = NSAttributedString(string: "... View more")
        description.attributedReadLessText = NSAttributedString(string: " View less")
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
        self.addSubview(descriptionLabel)
        
        
        NSLayoutConstraint.activate([
            tickImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            tickImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            tickImage.widthAnchor.constraint(equalToConstant: 20),
            tickImage.heightAnchor.constraint(equalToConstant: 20),
            
            descriptionLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            descriptionLabel.leadingAnchor.constraint(equalTo: tickImage.trailingAnchor, constant: 4),
            descriptionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            descriptionLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            descriptionLabel.widthAnchor.constraint(equalToConstant: 310),
        ])
    }
    func configure(with model: ProductModel) {
        descriptionLabel.text = model.description
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
