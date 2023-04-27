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
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        
        tableView.register(AdBannerCell.self, forCellReuseIdentifier: AdBannerCell.reuseIdentifier)
        tableView.register(CategoriesSection.self, forCellReuseIdentifier: CategoriesSection.reuseIdentifier)
        tableView.register(FeaturedProducts.self, forCellReuseIdentifier: FeaturedProducts.reuseIdentifier)
        tableView.register(HotDealsOfTheDay.self, forCellReuseIdentifier: HotDealsOfTheDay.reuseIdentifier)
//        tableView.register(ecomImage.self, forCellReuseIdentifier: ecomImage.reuseIdentifier)
        tableView.register(PopularBrand.self, forCellReuseIdentifier: PopularBrand.reuseIdentifier)

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
            tableView.topAnchor.constraint(equalTo: searchBar.bottomAnchor, constant: -5),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0)
        ])
        tableView.backgroundColor = UIColor(named: "Color")



    }

}
        
extension HomeController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 6
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
           switch section {
           case 0:
               return ""
           case 1:
               return "Categories"
           case 2:
               return "Featured Products"
           case 3:
               return "Hot Deals Of TheDay"
           case 4:
               return "Popular Brand"
           default:
              return nil
           }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
                  let cell = tableView.dequeueReusableCell(withIdentifier: AdBannerCell.reuseIdentifier, for: indexPath) as! AdBannerCell
            cell.backgroundColor = .clear

                  return cell
        case 1:
                  let cell = tableView.dequeueReusableCell(withIdentifier: CategoriesSection.reuseIdentifier, for: indexPath) as! CategoriesSection
            cell.backgroundColor = .clear

                  return cell
        case 2:
                  let cell = tableView.dequeueReusableCell(withIdentifier: FeaturedProducts.reuseIdentifier, for: indexPath) as! FeaturedProducts
            cell.backgroundColor = .clear

                  return cell
        case 3:
                  let cell = tableView.dequeueReusableCell(withIdentifier: HotDealsOfTheDay.reuseIdentifier, for: indexPath) as! HotDealsOfTheDay
            cell.backgroundColor = .clear
            return cell

        
//        case 5:
//            let cell = tableView.dequeueReusableCell(withIdentifier: ecomImage.reuseIdentifier, for: indexPath) as! ecomImage
//                  return cell
//
       default:
                  let cell = tableView.dequeueReusableCell(withIdentifier: PopularBrand.reuseIdentifier, for: indexPath) as! PopularBrand
            cell.backgroundColor = .clear
                  return cell
            }
    }
    
    
}


extension HomeController: UITableViewDelegate {
       func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
           
       }
   }
extension AdBannerCell: UIScrollViewDelegate {
          func scrollViewDidScroll(_ scrollView: UIScrollView) {
            let pageIndex = Int(scrollView.contentOffset.x / scrollView.frame.width)
            pageControl.currentPage = pageIndex
          }
        }


//extension HomeController: UIScrollViewDelegate {
//  func scrollViewDidScroll(_ scrollView: UIScrollView) {
//    let pageIndex = Int(scrollView.contentOffset.x / scrollView.frame.width)
//    pageControl.currentPage = pageIndex
        
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
