//
//  AdBanner.swift
//  eSewaMarket
//
//  Created by Omar  on 4/24/23.
//

import UIKit

class AdBannerCell: UITableViewCell, UICollectionViewDelegate {
    
    let pageControl = UIPageControl()

    private let cellReuseIdentifier = "AdBannerCell"
    
    
    
    // Initialize collectionView
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .white
        collectionView.isPagingEnabled = true
        return collectionView
    }()
    
    
    static let reuseIdentifier = "AdBannerCell"
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        // Add the collectionView to the contentView
        contentView.addSubview(collectionView)
        setupCollectionView()

        // Add the pageControl to the contentView
        contentView.addSubview(pageControl)

        // Set the pageControl's constraints
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

        
//        extension AdBannerCell: UIScrollViewDelegate {
//          func scrollViewDidScroll(_ scrollView: UIScrollView) {
//            let pageIndex = Int(scrollView.contentOffset.x / scrollView.frame.width)
//            pageControl.currentPage = pageIndex
//          }
//        }
        func scrollViewDidScroll(_ scrollView: UIScrollView) {
            let pageIndex = round(scrollView.contentOffset.x / scrollView.frame.width)
            pageControl.currentPage = Int(pageIndex)
            let visibleCells = collectionView.visibleCells
                       guard let firstVisibleCell = visibleCells.first else { return }
                       let visibleIndex = collectionView.indexPath(for: firstVisibleCell)?.item ?? 0
                       pageControl.currentPage = visibleIndex
           
        }


        
        collectionView.dataSource = self
           collectionView.delegate = self
        
        
        // Activate constraints
              NSLayoutConstraint.activate([
                  collectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
                  collectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
                  collectionView.topAnchor.constraint(equalTo: contentView.topAnchor),
                  collectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
                  collectionView.heightAnchor.constraint(equalToConstant: 170)
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
        return CGSize(width: 350, height: 190)
    }
        
}
        
    extension AdBannerCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
                    return 4
                }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
           let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellReuseIdentifier, for: indexPath) as! AdCell
        cell.imageView.tag = indexPath.item
                    return cell
                }
            }

        

    class AdCell: UICollectionViewCell {

         let imageView: UIImageView = {
            let imageView = UIImageView(image: UIImage(named: "image1"))
            imageView.contentMode = .scaleToFill
            imageView.clipsToBounds = true
            imageView.layer.cornerRadius = 10
            imageView.translatesAutoresizingMaskIntoConstraints = false
            return imageView
        }()

        override init(frame: CGRect) {
            super.init(frame: frame)

            contentView.addSubview(imageView)

            NSLayoutConstraint.activate([
                imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
                imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
                imageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 15),
                imageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
                imageView.heightAnchor.constraint(equalToConstant: 10)
            ])
            
            
        }
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
    }



//Original
//import UIKit
//
//class AdBannerCell: UITableViewCell, UICollectionViewDelegate {
//
//    private let cellReuseIdentifier = "AdBannerCell"
//
//
//
//    // Initialize collectionView
//    let collectionView: UICollectionView = {
//        let layout = UICollectionViewFlowLayout()
//        layout.scrollDirection = .horizontal
//        layout.minimumInteritemSpacing = 10
//        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
//        collectionView.translatesAutoresizingMaskIntoConstraints = false
//        collectionView.backgroundColor = .white
//        return collectionView
//    }()
//
//    static let reuseIdentifier = "AdBannerCell"
//
//    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
//            super.init(style: style, reuseIdentifier: reuseIdentifier)
//
//            // Add the collectionView to the contentView
//            contentView.addSubview(collectionView)
//            setupCollectionView()
//
//
//        collectionView.dataSource = self
//           collectionView.delegate = self
//
//
//        // Activate constraints
//              NSLayoutConstraint.activate([
//                  collectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
//                  collectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
//                  collectionView.topAnchor.constraint(equalTo: contentView.topAnchor),
//                  collectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
//                  collectionView.heightAnchor.constraint(equalToConstant: 170)
//              ])
//
//              // Register cell
//              collectionView.register(AdCell.self, forCellWithReuseIdentifier: cellReuseIdentifier)
//          }
//
//
//        required init?(coder: NSCoder) {
//            fatalError("init(coder:) has not been implemented")
//        }
//
//        private func setupCollectionView() {
//            collectionView.backgroundColor = .clear
//        }
//    }
//
//extension AdBannerCell: UICollectionViewDelegateFlowLayout {
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        return CGSize(width: 350, height: 170)
//    }
//
//}
//
//    extension AdBannerCell: UICollectionViewDataSource {
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//
//                    return 4
//                }
//
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//           let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellReuseIdentifier, for: indexPath) as! AdCell
//                    return cell
//                }
//            }
//
//
//
//    class AdCell: UICollectionViewCell {
//
//        private let imageView: UIImageView = {
//            let imageView = UIImageView(image: UIImage(named: "image4"))
//            imageView.contentMode = .scaleToFill
//            imageView.clipsToBounds = true
//            imageView.layer.cornerRadius = 30
//            imageView.translatesAutoresizingMaskIntoConstraints = false
//            return imageView
//        }()
//
//        override init(frame: CGRect) {
//            super.init(frame: frame)
//
//            contentView.addSubview(imageView)
//
//            NSLayoutConstraint.activate([
//                imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
//                imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
//                imageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
//                imageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
//                imageView.heightAnchor.constraint(equalToConstant: 150)
//            ])
//        }
//
//
//        required init?(coder: NSCoder) {
//            fatalError("init(coder:) has not been implemented")
//        }
//    }
//
