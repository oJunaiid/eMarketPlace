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
    
    //Setting up CollectionView
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumInteritemSpacing = 10
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
               collectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
               collectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
               collectionView.topAnchor.constraint(equalTo: contentView.topAnchor),
               collectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
               collectionView.heightAnchor.constraint(equalToConstant: 100),
               collectionView.widthAnchor.constraint(equalToConstant: 100)
           ])
   
    //Cell Registration
    
    collectionView.register(CategoriesCell.self, forCellWithReuseIdentifier: cellReuseIdentifier)
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
            return 4
        }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellReuseIdentifier, for: indexPath) as! CategoriesCell
               return cell
           }
    }
    
extension CategoriesSection: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 70, height: 100)
    }
}


class CategoriesCell: UICollectionViewCell {
    
    var label = UILabel()
    var cImage = UIImage()
    var imageView = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.backgroundColor = UIColor(red: 255, green: 255, blue: 255, alpha: 1)
        contentView.layer.cornerRadius = 20
        contentView.layer.masksToBounds = true

        
        // Categorie Lable
        label.text = "Mobile"
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 10)
        contentView.addSubview(label)
        
        label.translatesAutoresizingMaskIntoConstraints = false
               NSLayoutConstraint.activate([
                label.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
                label.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -13),
                label.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -5)
               ])
        
        // Categorie Image
        cImage = UIImage(systemName: "iphone")!
        
               imageView.image = cImage
        imageView.tintColor = .green
        imageView.backgroundColor = .lightGray
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
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}




