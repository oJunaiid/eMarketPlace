//
//  RecommendedForYOu.swift
//  eSewaMarket
//
//  Created by Omar  on 5/30/23.
//

import UIKit

class RecommendedForYou: UITableViewCell {
    
    private let cellReuseIdentifier = "RecommendedForYou"
    
    static let reuseIdentifier = "RecommendedForYou"

    var products: [ProductModel]?
    
    var itemClicked: ((ProductModel) -> ())?

    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumInteritemSpacing = 0
        layout.collectionView?.showsHorizontalScrollIndicator = false
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .systemPink
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.isScrollEnabled = false

        return collectionView
    }()
    
override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    
    contentView.addSubview(collectionView)
    setupCollectionView()
    
        collectionView.dataSource = self
        collectionView.delegate = self
    
            NSLayoutConstraint.activate([
               collectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
               collectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
               collectionView.topAnchor.constraint(equalTo: contentView.topAnchor),
               collectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
               collectionView.heightAnchor.constraint(equalToConstant: 1050),
               collectionView.widthAnchor.constraint(equalToConstant: 100)
           ])
    
    collectionView.register(RecommendedCell.self, forCellWithReuseIdentifier: cellReuseIdentifier)
    
        }

    func configure(with product: [ProductModel]) {
        self.products = product.shuffled()
        collectionView.reloadData()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupCollectionView() {
        collectionView.backgroundColor = .clear
    }
}

extension RecommendedForYou: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return products?.count ?? 0
        }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let item = products?[indexPath.row]
        if let item = item {
            self.itemClicked?(item)
        }
        
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellReuseIdentifier, for: indexPath) as! RecommendedCell
        
        if let product = products?[indexPath.row] {
            cell.configure(with: product)
        }
        
        return cell
    }
}


extension RecommendedForYou: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let padding: CGFloat = 3
           let numberOfItemsPerRow: CGFloat = 2
           let availableWidth = collectionView.bounds.width - padding * (numberOfItemsPerRow + 1)
           let itemWidth = availableWidth / numberOfItemsPerRow
           
           return CGSize(width: itemWidth, height: 255)
    }
}


class RecommendedCell: UICollectionViewCell {
    
    var productImage = UIImageView()
    let name = UILabel()
    let categoryLine = UILabel()
    let productPrice = UILabel()
    let likeButton = UIButton()
    let addButtonView = UIView()
    let addToCart = UIButton()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        self.layer.cornerRadius = 15
        contentView.addSubview(productImage)
        contentView.addSubview(productPrice)
        contentView.addSubview(likeButton)
        contentView.addSubview(name)
        contentView.addSubview(addButtonView)
        contentView.addSubview(categoryLine)
        contentView.addSubview(addToCart)

        productImage.translatesAutoresizingMaskIntoConstraints = false
        productImage.contentMode = .scaleAspectFit
        
        productImage.translatesAutoresizingMaskIntoConstraints = false
       

        NSLayoutConstraint.activate([
            productImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 30),
            productImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0),
            productImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,constant: 0),
            productImage.heightAnchor.constraint(equalToConstant: 130)
        ])
        
        
        name.font = UIFont.systemFont(ofSize: 14)
        name.numberOfLines = 1
        
  
        name.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            name.topAnchor.constraint(equalTo: productImage.bottomAnchor, constant: 4),
            name.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5),
            name.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 4)

        ])
        
        categoryLine.text = "IN STOCK - NOTHING"
        categoryLine.textColor = .lightGray
        categoryLine.font = UIFont.systemFont(ofSize: 10)
        categoryLine.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            categoryLine.topAnchor.constraint(equalTo: name.bottomAnchor, constant: 1),
            categoryLine.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5)
            
        ])
        
//        productPrice.text = "Rs. 70,000"
        productPrice.textColor = .black
        productPrice.font = UIFont.systemFont(ofSize: 14)
        productPrice.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            productPrice.topAnchor.constraint(equalTo: categoryLine.bottomAnchor, constant: 4),
            productPrice.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5)
            
        ])
        
        addButtonView.translatesAutoresizingMaskIntoConstraints = false
        addButtonView.backgroundColor = .black
        addButtonView.layer.cornerRadius = 10
        addButtonView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMaxYCorner]
        
        NSLayoutConstraint.activate([
            addButtonView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0),
            addButtonView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0),
            addButtonView.heightAnchor.constraint(equalToConstant: 40),
            addButtonView.widthAnchor.constraint(equalToConstant: 40)
        ])
        
        likeButton.setImage(UIImage(systemName: "heart"), for: .normal)
        likeButton.tintColor = .lightGray
        likeButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            likeButton.topAnchor.constraint(equalTo: productPrice.bottomAnchor, constant: 5),
            likeButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5)
        ])
        
        addToCart.setImage(UIImage(systemName: "plus"), for: .normal)
        addToCart.translatesAutoresizingMaskIntoConstraints = false
        addToCart.tintColor = .white
        
        
        NSLayoutConstraint.activate([
            addToCart.centerXAnchor.constraint(equalTo: addButtonView.centerXAnchor),
            addToCart.centerYAnchor.constraint(equalTo: addButtonView.centerYAnchor),
        ])
        

    }
    
    func configure(with product: ProductModel) {
        name.text = product.title
        productPrice.text = "$\(product.price ?? 00)"
        categoryLine.text = product.category

        if let url = URL(string: product.image ?? "t") {
            productImage.kf.setImage(with: url)
        }
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

