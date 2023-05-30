//
//  AdBanner.swift
//  eSewaMarket
//
//  Created by Omar  on 4/24/23.
//

import UIKit

class AdBannerCell: UITableViewCell, UICollectionViewDelegate {
    
    //    var itemList: [BannerImage]?
    
    let pageControl = UIPageControl()
    
    private let cellReuseIdentifier = "AdBannerCell"
    
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .white
        collectionView.isPagingEnabled = true
        collectionView.showsHorizontalScrollIndicator = false
        return collectionView
    }()
    
    
    static let reuseIdentifier = "AdBannerCell"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(collectionView)
        setupCollectionView()
        
        contentView.addSubview(pageControl)
        
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            pageControl.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            pageControl.topAnchor.constraint(equalTo: collectionView.bottomAnchor, constant: -7),
        ])
        
        pageControl.transform = CGAffineTransform(scaleX: 0.7, y: 0.7)
        pageControl.pageIndicatorTintColor = .black
        pageControl.currentPageIndicatorTintColor = .red
        pageControl.numberOfPages = 4 // set the number of pages to match the number of items in the collection view
        pageControl.currentPage = 0 // set the current page to the first page (index 0)
        
        
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        // Activate constraints
        NSLayoutConstraint.activate([
            collectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
            collectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            collectionView.topAnchor.constraint(equalTo: contentView.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            collectionView.heightAnchor.constraint(equalToConstant: 180)
        ])
        
        // Register cell
        collectionView.register(AdCell.self, forCellWithReuseIdentifier: cellReuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupCollectionView() {
        collectionView.backgroundColor = .clear
    }
}

extension AdBannerCell: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 350, height: 170)
    }
    
}

extension AdBannerCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellReuseIdentifier, for: indexPath) as! AdCell
        return cell
    }
}



class AdCell: UICollectionViewCell {
    
    let imageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "banner2"))
        imageView.contentMode = .scaleToFill
        imageView.layer.cornerRadius = 10
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(imageView)
        
        NSLayoutConstraint.activate([
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5),
            imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -5),
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0),
            imageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5),
            imageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),

        ])
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


