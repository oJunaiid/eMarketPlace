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
        
        NSLayoutConstraint.activate([
            contentView.heightAnchor.constraint(equalToConstant: 190),
            
            cellImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            cellImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: -10),
            cellImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            cellImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            cellImageView.heightAnchor.constraint(equalToConstant: 110)
        ])
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        cellImageView.layer.cornerRadius = 30
        cellImageView.clipsToBounds = true
    }
    
    func configure(with image: UIImage?) {
        if let image = image {
            cellImageView.image = image
        } else {
            cellImageView.image = UIImage(named: "ecom")
        }
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        // Do not call super implementation to prevent highlighting
    }
}
