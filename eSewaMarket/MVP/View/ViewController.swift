//
//  ViewController.swift
//  eSewaMarket
//
//  Created by Omar  on 4/12/23.
//

import UIKit

class HomeController: UIViewController, UIScrollViewDelegate {

    let tableView = UITableView()
    let searchController = UISearchController(searchResultsController: nil)
  
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        setupViews()
    }

    
    private func setupViews() {
        
        // Navigation Bar
        let navBar = UINavigationBar(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 44))
        view.addSubview(navBar)

        // Add logo image to navigation bar
        let logoImage = UIImageView(image: UIImage(named: "eMarket"))
        logoImage.contentMode = .scaleAspectFit
        logoImage.translatesAutoresizingMaskIntoConstraints = false
        navBar.addSubview(logoImage)

        NSLayoutConstraint.activate([
            logoImage.leadingAnchor.constraint(equalTo: navBar.leadingAnchor, constant: 20),
            logoImage.topAnchor.constraint(equalTo: navBar.topAnchor, constant: 20),
            logoImage.heightAnchor.constraint(equalToConstant: 90),
            logoImage.widthAnchor.constraint(equalToConstant: 180)
        ])

        // Add hello text to navigation bar
        let helloText = UILabel()
        helloText.text = "Hello Tim, everything you will discover here"
        helloText.numberOfLines = 1;
        helloText.adjustsFontSizeToFitWidth = true
        helloText.translatesAutoresizingMaskIntoConstraints = false
        navBar.addSubview(helloText)

        NSLayoutConstraint.activate([
            helloText.topAnchor.constraint(equalTo: logoImage.bottomAnchor, constant: -10),
            helloText.leadingAnchor.constraint(equalTo: navBar.leadingAnchor, constant: 20),
            helloText.trailingAnchor.constraint(equalTo: navBar.trailingAnchor, constant: -20),
            helloText.heightAnchor.constraint(equalToConstant: 15)
        ])
        // Create search bar
        let searchBar = UISearchBar(frame: CGRect(x: 0, y: 120, width: view.frame.width, height: 44))
        navBar.addSubview(searchBar)
        
        // Add table view to main view
        view.addSubview(tableView)
        
        

        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            tableView.topAnchor.constraint(equalTo: searchBar.bottomAnchor, constant: 0),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0)
        ])
        tableView.backgroundColor = .systemPink

    }

}
        
        
        
        
    // Add images to scroll view
//    for i in 0..<images.count {
//      let imageView = UIImageView()
//        imageView.layer.cornerRadius = 10
//        imageView.layer.masksToBounds = true
//        imageView.image = UIImage(named: "image4")
//        imageView.contentMode = .scaleAspectFill
//      imageView.clipsToBounds = true
//      imageScrollView.addSubview(imageView)
//
//        imageView.translatesAutoresizingMaskIntoConstraints = false
//        NSLayoutConstraint.activate([
//            imageView.leadingAnchor.constraint(equalTo: tableView.leadingAnchor, constant: 0),
//            imageView.trailingAnchor.constraint(equalTo: tableView.trailingAnchor, constant: 0),
//            imageView.topAnchor.constraint(equalTo: tableView.topAnchor, constant: 0),
//        ])
//    }
//
//    // Create page control
//    pageControl = UIPageControl(frame: CGRect(x: 10, y: imageScrollView.frame.maxY, width: view.frame.width, height: 30))
//    pageControl.numberOfPages = images.count
//    pageControl.currentPage = 0
//    pageControl.pageIndicatorTintColor = .lightGray
//    pageControl.currentPageIndicatorTintColor = .black
//      pageControl.transform = CGAffineTransform(scaleX: 1, y: 1)
//
//        pageControl.translatesAutoresizingMaskIntoConstraints = false
//        NSLayoutConstraint.activate([
//            pageControl.leadingAnchor.constraint(equalTo: tableView.leadingAnchor, constant: 0),
//            pageControl.trailingAnchor.constraint(equalTo: tableView.trailingAnchor, constant: 0),
//            pageControl.topAnchor.constraint(equalTo: tableView.topAnchor, constant: 0),
//        ])
//    tableView.addSubview(pageControl)
//  }
//}
//
//extension HomeController: UIScrollViewDelegate {
//  func scrollViewDidScroll(_ scrollView: UIScrollView) {
//    let pageIndex = Int(scrollView.contentOffset.x / scrollView.frame.width)
//    pageControl.currentPage = pageIndex
//  }
//}
