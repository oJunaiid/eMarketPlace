//
//  ItemList.swift
//  eSewaMarket
//
//  Created by Omar  on 4/27/23.
//



import UIKit

class AddToCartViewCell: UITableViewCell {

  static let identifier = "AddToCartViewCell"
    
    var itemList: [AddCartModel]?
    
  
//    func updatePriceLabel() {
//            let updatedPrice = calculatePrice(quantity: quantity)
//            productQuantityLabel.text = "$\(updatedPrice)"
//            countChanged?(Double(updatedPrice))
////        }
    let containerView = UIView()
 
     var image: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Image")
        imageView.contentMode = .scaleAspectFill
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
//        priceLabel.text = ""
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
        contentView.backgroundColor = UIColor(named: "Color")

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
    
    private var price: Double = 3000.0
    private var count: Int = 1


//    func updatedPrice() {
//
//        let totalPrice = price * Double(count)
//        priceLabel.text = String(format: "Rs.%.2f", totalPrice)
//        checkoutPrice?(totalPrice)
//    }
//
    func updatePriceAndCount() {
        quantityLabel.text = String(format: "%02d", count)
        let totalPrice = price * Double(count)
        priceLabel.text = String(format: "Rs.%.2f", totalPrice)
    }

//    func updatedPrice() {
//        let totalPrice = price * Double(count)
//        priceLabel.text = String(format: "Rs.%.2f", totalPrice)
//    }
    
    
    @objc func addButtonTapped() {
        count += 1
        updatePriceAndCount()
//        updatedPrice()
    }

    @objc func subtractButtonTapped() {
        if count > 1 {
            count -= 1
            updatePriceAndCount()
//            updatedPrice()
        }

   

    }
    

    
    
    override func layoutSubviews() {
        super.layoutSubviews()

        addButton.addTarget(self, action: #selector(addButtonTapped), for: .touchUpInside)
        subtractButton.addTarget(self, action: #selector(subtractButtonTapped), for: .touchUpInside)
//        setupGestureRecognizers()

        setupViews()
    }
    
    private func setupViews() {
        
        
        // pin image view
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
             
        // pin title label
            
            titleLabel.leadingAnchor.constraint(equalTo: image.trailingAnchor, constant: 8),
            titleLabel.heightAnchor.constraint(equalToConstant: 80),
            titleLabel.widthAnchor.constraint(equalToConstant: 110),
            
        //CUSTOM VIEWWWW
            customView.topAnchor.constraint(equalTo: self.containerView.topAnchor),
            customView.leadingAnchor.constraint(equalTo: self.containerView.trailingAnchor, constant: -38),
            customView.bottomAnchor.constraint(equalTo: self.containerView.bottomAnchor),
            customView.widthAnchor.constraint(equalToConstant: 38),
            
            // SUB BUTTON
            subtractButton.topAnchor.constraint(equalTo: customView.topAnchor, constant: 5),
            subtractButton.centerXAnchor.constraint(equalTo: customView.centerXAnchor),
            // ADD BUTTON
            addButton.bottomAnchor.constraint(equalTo: customView.bottomAnchor, constant: -5),
            addButton.centerXAnchor.constraint(equalTo: customView.centerXAnchor),
            
            //Counter label
            quantityLabel.centerYAnchor.constraint(equalTo: customView.centerYAnchor),
            quantityLabel.centerXAnchor.constraint(equalTo: customView.centerXAnchor),

            // pin subtitle label
            descriptionLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor, constant: 1),
            descriptionLabel.heightAnchor.constraint(equalToConstant: 120),
            
            // pin price label
            priceLabel.leadingAnchor.constraint(equalTo: descriptionLabel.leadingAnchor, constant: 0),
            priceLabel.heightAnchor.constraint(equalToConstant: 180),
    
          
        ])
      
       
    }
    
}

