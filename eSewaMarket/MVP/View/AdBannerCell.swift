//
//  AdBanner.swift
//  eSewaMarket
//
//  Created by Omar  on 4/24/23.
//

import UIKit

class AdBannerCell: UITableViewCell {
    
    private let cellReuseIdentifier = "AdBannerTableViewCell"
    
    // Create image scroll view For banner
    let images = ["image1", "image2", "image3", "image4"]
    let imageScrollView = UIScrollView()
    let pageControl = UIPageControl()
    
    
    
//    imageScrollView = UIScrollView(frame: CGRect(x: 0, y: 205, width: view.frame.width, height: 150))
//    imageScrollView.isPagingEnabled = true
//    imageScrollView.showsHorizontalScrollIndicator = false
//    imageScrollView.contentSize = CGSize(width: view.frame.width * CGFloat(images.count), height: imageScrollView.frame.height)
//    imageScrollView.delegate = self
//    tableView.addSubview(imageScrollView)
//
}
