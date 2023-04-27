//
//  FeaturedProducts.swift
//  eSewaMarket
//
//  Created by Omar  on 4/25/23.
//


import UIKit

class FeaturedProducts: UITableViewCell {
    
    private let cellReuseIdentifier = "FeaturedProducts"
    
    static let reuseIdentifier = "FeaturedProducts"
    
    
//    let scrollButton = UIButton(type: .system)
     
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
    
//    contentView.addSubview(scrollButton)
    contentView.addSubview(collectionView)
    setupCollectionView()
    
    // Set the dataSource and delegate of the collectionView
        collectionView.dataSource = self
        collectionView.delegate = self
    

//    Activate constraints
           NSLayoutConstraint.activate([
//            scrollButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
//                   scrollButton.topAnchor.constraint(equalTo: contentView.topAnchor),
//                   scrollButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
//                   scrollButton.widthAnchor.constraint(equalToConstant: 30),

               collectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
               collectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
               collectionView.topAnchor.constraint(equalTo: contentView.topAnchor),
               collectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
               collectionView.heightAnchor.constraint(equalToConstant: 250),
               collectionView.widthAnchor.constraint(equalToConstant: 100),
               
               
           ])
   
    //Cell Registration
    
    collectionView.register(FeaturedCell.self, forCellWithReuseIdentifier: cellReuseIdentifier)
    
    //Adding target to the button
//    scrollButton.addTarget(self, action: #selector(scrollToRight), for: .touchUpInside)

        }
    

    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
//    private func setupScrollButton() {
//            scrollButton.backgroundColor = .clear
//            scrollButton.setImage(UIImage(systemName: "arrow.right.square"), for: .normal)
//            scrollButton.tintColor = .gray
//        }
    
    private func setupCollectionView() {
        collectionView.backgroundColor = .clear

    }
    
    @objc func scrollToRight() {
         let lastItemIndex = collectionView.numberOfItems(inSection: 0) - 1
         let lastItemIndexPath = IndexPath(item: lastItemIndex, section: 0)
         collectionView.scrollToItem(at: lastItemIndexPath, at: .right, animated: true)
     }
}



extension FeaturedProducts: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return 7
        }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellReuseIdentifier, for: indexPath) as! FeaturedCell
               return cell
           }
    }
    
extension FeaturedProducts: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 170, height: 270)
    }
}


class FeaturedCell: UICollectionViewCell {
    
    var productImage = UIImageView()
    var descriptionImage = UILabel()
    var inStock = UILabel()
    var priceProduct = UILabel()
    var likeButton = UIButton()
    var addButtonView = UIView()
    var addToCart = UIButton()
    

//    var plusColor = UIView()

    
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
        contentView.addSubview(addButtonView)
        
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
        
        addButtonView.translatesAutoresizingMaskIntoConstraints = false
        addButtonView.backgroundColor = .systemGreen
        addButtonView.layer.cornerRadius = 20
        addButtonView.layer.maskedCorners = [.layerMinXMinYCorner]

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
        
        //GREEN COLOR BELOW BUTTON
        
        
//        cornerView.translatesAutoresizingMaskIntoConstraints = false
//        NSLayoutConstraint.activate([
//            cornerView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 50),
//            cornerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 50),
//            cornerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 50),
//            cornerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 50)
//        ])

//        plusColor.backgroundColor = .systemGreen
//        plusColor.translatesAutoresizingMaskIntoConstraints = false
//        NSLayoutConstraint.activate([
//
//            plusColor.topAnchor.constraint(equalTo: self.contentView.topAnchor),
//            plusColor.leadingAnchor.constraint(equalTo: likeButton.trailingAnchor, constant: 40),
//            plusColor.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
//            plusColor.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
//            plusColor.widthAnchor.constraint(equalToConstant: 10)
//            ])
                                    
            
      //ADD TO CART BUTTON
        addToCart.setImage(UIImage(systemName: "plus"), for: .normal)
        addToCart.translatesAutoresizingMaskIntoConstraints = false
        addToCart.tintColor = .white
    

//        addToCart.backgroundColor = .green
//        addToCart.layer.cornerRadius = min(addToCart.frame.width, addToCart.frame.height) / 2.0

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


