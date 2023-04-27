//
//  PopularBrand.swift
//  eSewaMarket
//
//  Created by Omar  on 4/25/23.
//

import UIKit

class PopularBrand: UITableViewCell {
    
    private let cellReuseIdentifier = "PopularBrand"
    
    static let reuseIdentifier = "PopularBrand"

    //Setting up CollectionView
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumInteritemSpacing = 10
        layout.collectionView?.showsHorizontalScrollIndicator = false
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .systemPink
        return collectionView
    }()
    
override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    
    // Add the collectionView to the contentView
    contentView.addSubview(collectionView)
    setupCollectionView()
    
    // Set the dataSource and delegate of the collectionView
        collectionView.dataSource = self
        collectionView.delegate = self
    
    
//    Activate constraints
           NSLayoutConstraint.activate([
               collectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
               collectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
               collectionView.topAnchor.constraint(equalTo: contentView.topAnchor),
               collectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
               collectionView.heightAnchor.constraint(equalToConstant: 200),
               collectionView.widthAnchor.constraint(equalToConstant: 100)
           ])
   
    //Cell Registration
    
    collectionView.register(PopularCell.self, forCellWithReuseIdentifier: cellReuseIdentifier)
        }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupCollectionView() {
        collectionView.backgroundColor = .clear
    }
}

extension PopularBrand: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return 4
        }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellReuseIdentifier, for: indexPath) as! PopularCell
               return cell
           }
    }
    
extension PopularBrand: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 170, height: 270)
    }
}


class PopularCell: UICollectionViewCell {
    
    var productImage = UIImageView()
    var descriptionImage = UILabel()
    var inStock = UILabel()
    var priceProduct = UILabel()
    var likeButton = UIButton()
    var addToCart = UIButton()
    var addButtonView = UIView()
    
    override init(frame: CGRect) {
          super.init(frame: frame)
    
          contentView.backgroundColor = UIColor(red: 255, green: 255, blue: 255, alpha: 1)
          contentView.layer.cornerRadius = 40
        
        //PRODUCT IMAGE
        
        productImage.translatesAutoresizingMaskIntoConstraints = false
              contentView.addSubview(productImage)
        
        productImage.image = UIImage(named: "as")
        productImage.contentMode = .scaleAspectFit // set the content mode to maintain aspect ratio

        productImage.layer.cornerRadius = 20
        productImage.translatesAutoresizingMaskIntoConstraints = false
              contentView.addSubview(productImage)
        
        NSLayoutConstraint.activate([
            productImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 30),
            productImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: -5),
            productImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,constant: 5),
            productImage.heightAnchor.constraint(equalToConstant: 140)
              ])
        
        //DESCRIPTION OF THE IMAGE
        descriptionImage.text = "Nothing 2"
        descriptionImage.font = UIFont.systemFont(ofSize: 14)

        contentView.addSubview(descriptionImage)
        
        descriptionImage.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            descriptionImage.topAnchor.constraint(equalTo: productImage.bottomAnchor, constant: 4),
            descriptionImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5)
            
        ])
        
        //IN STOCK
        inStock.text = "IN STOCK - NOTHING"
        inStock.textColor = .lightGray
        inStock.font = UIFont.systemFont(ofSize: 10)
        
        contentView.addSubview(inStock)
        
        inStock.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            inStock.topAnchor.constraint(equalTo: descriptionImage.bottomAnchor, constant: 1),
            inStock.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5)
            
        ])
        
        //PRICE
        priceProduct.text = "Rs. 70,000"
        priceProduct.textColor = .systemGreen
        priceProduct.font = UIFont.systemFont(ofSize: 14)
        priceProduct.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(priceProduct)
        
        NSLayoutConstraint.activate([
            priceProduct.topAnchor.constraint(equalTo: inStock.bottomAnchor, constant: 4),
            priceProduct.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5)
            
        ])
        
        //Green Color
        addButtonView.translatesAutoresizingMaskIntoConstraints = false
        addButtonView.backgroundColor = .systemGreen
        addButtonView.layer.cornerRadius = 20
        addButtonView.layer.maskedCorners = [.layerMinXMinYCorner]
        contentView.addSubview(addButtonView)

        NSLayoutConstraint.activate([
            addButtonView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0),
            addButtonView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0),
            addButtonView.heightAnchor.constraint(equalToConstant: 50),
            addButtonView.widthAnchor.constraint(equalToConstant: 40)
        ])
    
//  LIKE BUTTON
        likeButton.setImage(UIImage(systemName: "heart"), for: .normal)
        likeButton.tintColor = .lightGray
        likeButton.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(likeButton)
        
        NSLayoutConstraint.activate([
            likeButton.topAnchor.constraint(equalTo: priceProduct.bottomAnchor, constant: 5),
            likeButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5)
        ])
        
      //ADD TO CART BUTTON
        addToCart.setImage(UIImage(systemName: "plus"), for: .normal)
        addToCart.translatesAutoresizingMaskIntoConstraints = false
        addToCart.tintColor = .white
        contentView.addSubview(addToCart)
        
        NSLayoutConstraint.activate([
            addToCart.topAnchor.constraint(equalTo: priceProduct.bottomAnchor, constant: 5),
            addToCart.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10)
        ])
}
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
 
}


