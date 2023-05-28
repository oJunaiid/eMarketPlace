//
//  CategoriesCell.swift
//  eSewaMarket
//
//  Created by Omar  on 4/25/23.
//

import UIKit

class CategoriesSection: UITableViewCell, UICollectionViewDelegate {
    
    private let cellReuseIdentifier = "CategoriesCell"
    
    static let reuseIdentifier = "CategoriesCell"
    
    var category: [CategorieModel]?
    
    
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumInteritemSpacing = 10
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .systemPink
        collectionView.showsHorizontalScrollIndicator = false
        return collectionView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(collectionView)
        
        setupCollectionView()
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        
        NSLayoutConstraint.activate([
            collectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            collectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            collectionView.topAnchor.constraint(equalTo: contentView.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            collectionView.heightAnchor.constraint(equalToConstant: 80),
            collectionView.widthAnchor.constraint(equalToConstant: 100)
        ])
        
        //Cell Registration
        collectionView.register(CategoriesCell.self, forCellWithReuseIdentifier: cellReuseIdentifier)
    }
    
    func configure(with category: [CategorieModel]?) {
        if let category = category {
            self.category = category
            collectionView.reloadData()
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupCollectionView() {
        collectionView.backgroundColor = .clear
    }
}

extension CategoriesSection: UICollectionViewDataSource {
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return category?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellReuseIdentifier, for: indexPath) as! CategoriesCell
        if let category = category {
            let item = category[indexPath.row]
            cell.configure(with: item)
        }
        return cell
    }
}

extension CategoriesSection: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: 80, height: 90)
    }
    
}

//func calculateLabelWidth(for data: String) -> CGFloat {
//    let label = UILabel()
//    label.text = data // Use the passed data as the label's text
//    label.font = UIFont.boldSystemFont(ofSize: 10)
//
//    let labelSize = label.intrinsicContentSize
//
//    return labelSize.width
//}
class CategoriesCell: UICollectionViewCell {
    
    let label = UILabel()
    var categoryImage = UIImage()
    var imageView = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.backgroundColor = UIColor(red: 255, green: 255, blue: 255, alpha: 1)
        contentView.layer.cornerRadius = 20
        contentView.layer.masksToBounds = true
        
        
        label.text = "mobile"
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 10)
        contentView.addSubview(label)
        
        label.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            label.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            label.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            label.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0)
        ])
        
        
        categoryImage = UIImage(systemName: "iphone")!
        
        imageView.image = categoryImage
        imageView.tintColor = .black
        imageView.backgroundColor = UIColor(named: "Color")
        imageView.layer.cornerRadius = 10
        contentView.addSubview(imageView)
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            imageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            imageView.widthAnchor.constraint(equalToConstant: 50),
            imageView.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    func configure(with category: CategorieModel) {
        label.text = category.category
        imageView.image = category.imageName

        }
        
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}





