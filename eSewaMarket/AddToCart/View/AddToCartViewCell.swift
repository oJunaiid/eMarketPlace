//
//  ItemList.swift
//  eSewaMarket
//
//  Created by Omar  on 4/27/23.
//



import UIKit

class AddToCartViewCell: UITableViewCell {
    
    static let identifier = "AddToCartViewCell"
    
    let containerView = UIView()
    
    var image: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Image")
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 10 //rounded image
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
        
    }()
    
    var titleLabel: UILabel = {
        let label = UILabel()
        //        label.text = "Down Jacket"
        label.textColor = .black
        label.font = .systemFont(ofSize: 17, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        return label
    }()
    
    var descriptionLabel: UILabel = {
        let subLabel = UILabel()
        //        subLabel.text = "Uniqlo"
        subLabel.textColor = .gray
        subLabel.font = .systemFont(ofSize: 10, weight: .bold)
        subLabel.translatesAutoresizingMaskIntoConstraints = false
        subLabel.textAlignment = .left
        return subLabel
    }()
    
    var subtractButton: UIButton = {
        let subButton = UIButton()
        subButton.setImage(UIImage(systemName: "minus"), for: .normal)
        subButton.imageView?.contentMode = .scaleAspectFill
        subButton.translatesAutoresizingMaskIntoConstraints = false
        subButton.tintColor = .white
        return subButton
    }()
    
    var addButton: UIButton = {
        let addButton = UIButton()
        addButton.setImage(UIImage(systemName: "plus"), for: .normal)
        addButton.imageView?.contentMode = .scaleAspectFill
        addButton.translatesAutoresizingMaskIntoConstraints = false
        addButton.tintColor = .white
        return addButton
        
    }()
    //
    var priceLabel: UILabel = {
        let priceLabel = UILabel()
        priceLabel.font = UIFont.systemFont(ofSize: 16)
        priceLabel.textAlignment = .left
        priceLabel.translatesAutoresizingMaskIntoConstraints = false
        priceLabel.textColor = .black
        return priceLabel
        
    }()
    
    
    var quantityLabel: UILabel = {
        let productAmount = UILabel()
        productAmount.text = "01"
        productAmount.font = UIFont.systemFont(ofSize: 14)
        productAmount.translatesAutoresizingMaskIntoConstraints = false
        productAmount.textColor = .white
        return productAmount
    }()
    
    
    var customView: UIView = {
        let customBlack = UIView()
        customBlack.backgroundColor = .black
        customBlack.translatesAutoresizingMaskIntoConstraints = false
        customBlack.layer.cornerRadius = 10
        customBlack.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMaxXMaxYCorner, .layerMinXMaxYCorner]
        return customBlack
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        containerView.translatesAutoresizingMaskIntoConstraints = false
        containerView.backgroundColor = .white
        
        containerView.layer.cornerRadius = 20
        
        
        contentView.addSubview(containerView)
        contentView.backgroundColor = UIColor(named: "color1")
        
        contentView.addSubview(customView)
        contentView.addSubview(titleLabel)
        contentView.addSubview(image)
        contentView.addSubview(descriptionLabel)
        contentView.addSubview(addButton)
        contentView.addSubview(quantityLabel)
        contentView.addSubview(subtractButton)
        contentView.addSubview(priceLabel)
        
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var price: Double = 64
    var count: Int = 1
    var totalUpdatedPrice: Double?
    var priceChanged: ((Double, Int) -> ())?
    
    func updatePriceAndCount() {
        quantityLabel.text = String(format: "%02d", count)
        let totalPrice = price * Double(count)
        priceLabel.text = String(format: "$%.2f", totalPrice)
        totalUpdatedPrice = totalPrice
        self.priceChanged?(totalPrice, count)
    }
    
    @objc func addButtonTapped() {
        count += 1
        updatePriceAndCount()
    }
    
    @objc func subtractButtonTapped() {
        if count > 1 {
            count -= 1
            updatePriceAndCount()
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        addButton.addTarget(self, action: #selector(addButtonTapped), for: .touchUpInside)
        subtractButton.addTarget(self, action: #selector(subtractButtonTapped), for: .touchUpInside)
        
        setupViews()
    }
    
    private func setupViews() {
        
        
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            containerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            containerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            containerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            containerView.heightAnchor.constraint(equalToConstant: 180),
              
            image.topAnchor.constraint(equalTo: self.containerView.topAnchor, constant: 12),
            image.leadingAnchor.constraint(equalTo: self.containerView.leadingAnchor, constant: 12),
            image.bottomAnchor.constraint(equalTo: self.containerView.bottomAnchor, constant: -12),
            image.widthAnchor.constraint(equalToConstant: 100),
            image.heightAnchor.constraint(equalToConstant: 100),
            
            titleLabel.leadingAnchor.constraint(equalTo: image.trailingAnchor, constant: 8),
            titleLabel.heightAnchor.constraint(equalToConstant: 80),
            
            customView.topAnchor.constraint(equalTo: self.containerView.topAnchor),
            customView.leadingAnchor.constraint(equalTo: self.containerView.trailingAnchor, constant: -38),
            customView.bottomAnchor.constraint(equalTo: self.containerView.bottomAnchor),
            customView.widthAnchor.constraint(equalToConstant: 38),
            
            titleLabel.trailingAnchor.constraint(equalTo: customView.leadingAnchor, constant: -5),
            
            subtractButton.topAnchor.constraint(equalTo: customView.topAnchor, constant: 5),
            subtractButton.centerXAnchor.constraint(equalTo: customView.centerXAnchor),
            
            addButton.bottomAnchor.constraint(equalTo: customView.bottomAnchor, constant: -5),
            addButton.centerXAnchor.constraint(equalTo: customView.centerXAnchor),
            
            quantityLabel.centerYAnchor.constraint(equalTo: customView.centerYAnchor),
            quantityLabel.centerXAnchor.constraint(equalTo: customView.centerXAnchor),
            
            descriptionLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor, constant: 1),
            descriptionLabel.heightAnchor.constraint(equalToConstant: 120),
            
            priceLabel.leadingAnchor.constraint(equalTo: descriptionLabel.leadingAnchor, constant: 0),
            priceLabel.heightAnchor.constraint(equalToConstant: 180),
        ])
    }
    
    func configure(with products: ProductModel) {
        self.count = products.count
        self.price = products.price ?? 0
        
        titleLabel.text = products.title
        descriptionLabel.text = products.category
        
        if let url = URL(string: products.image ?? "") {
            image.kf.setImage(with: url)
        }
        quantityLabel.text = String(format: "%02d", products.count)
        priceLabel.text = "$\(products.updatedPrice ?? 0)"
    }
}
