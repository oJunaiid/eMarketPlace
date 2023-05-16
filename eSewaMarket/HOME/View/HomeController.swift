//
//  ViewController.swift
//  eSewaMarket
//
//  Created by Omar  on 4/12/23.
//

import UIKit
class HomeController: UIViewController, UIScrollViewDelegate, HomePresenterProtocol {
    
    var presenter: HomePresenter?
    var products = [ProductModel]()
    var items: [BannerPresenter]?
    
    let tableView = UITableView()
    let searchController = UISearchController(searchResultsController: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        setupViews()
        presenter = (HomePresenter(delegate: self))
        presenter?.fetch()
        
        let footer = UIView()
        footer.backgroundColor = .lightGray
        footer.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(footer)
        
        let homeButton = UIButton()
        homeButton.setImage(UIImage(systemName: "house"), for: .normal)
        homeButton.setTitleColor(.black, for: .normal)
        homeButton.tintColor = .white
        homeButton.translatesAutoresizingMaskIntoConstraints = false
        footer.addSubview(homeButton)
        
        let cartButton = UIButton()
        cartButton.setImage(UIImage(systemName: "cart"), for: .normal)
        cartButton.setTitleColor(.black, for: .normal)
        cartButton.tintColor = .white
        cartButton.translatesAutoresizingMaskIntoConstraints = false
        footer.addSubview(cartButton)
        
        let heartButton = UIButton()
        heartButton.setImage(UIImage(systemName: "heart"), for: .normal)
        heartButton.tintColor = .white
        heartButton.setTitleColor(.black, for: .normal)
        heartButton.translatesAutoresizingMaskIntoConstraints = false
        footer.addSubview(heartButton)
        
        let menuButton = UIButton()
        menuButton.setImage(UIImage(systemName: "ellipsis"), for: .normal)
        menuButton.setTitleColor(.black, for: .normal)
        menuButton.tintColor = .white
        menuButton.translatesAutoresizingMaskIntoConstraints = false
        footer.addSubview(menuButton)
        
        NSLayoutConstraint.activate([
            footer.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            footer.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            footer.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            footer.heightAnchor.constraint(equalToConstant: 50),
            
            homeButton.leadingAnchor.constraint(equalTo: footer.leadingAnchor, constant: 20),
            homeButton.centerYAnchor.constraint(equalTo: footer.centerYAnchor),
            
            cartButton.leadingAnchor.constraint(equalTo: homeButton.trailingAnchor, constant: 100),
            cartButton.centerYAnchor.constraint(equalTo: footer.centerYAnchor),
            
            heartButton.leadingAnchor.constraint(equalTo: cartButton.trailingAnchor, constant: 100),
            heartButton.centerYAnchor.constraint(equalTo: footer.centerYAnchor),
            
            menuButton.trailingAnchor.constraint(equalTo: footer.trailingAnchor, constant: -20),
            menuButton.centerYAnchor.constraint(equalTo: footer.centerYAnchor)
        ])
        
        cartButton.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        heartButton.addTarget(self, action: #selector(productdidTap), for: .touchUpInside)
        menuButton.addTarget(self, action: #selector(menuDidTap), for: .touchUpInside)
    }
    
    func didFetchModel(with products: [ProductModel]) {
        self.products = products
        tableView.reloadData()
    }
    
    func showError(_ message: String) {
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
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
        tableView.register(ImageCell.self, forCellReuseIdentifier: ImageCell.reuseIdentifier)
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
        
        let bellButton = UIButton()
        bellButton.setImage(UIImage(systemName: "bell"), for: .normal)
        bellButton.tintColor = .black
        bellButton.translatesAutoresizingMaskIntoConstraints = false
        navBar.addSubview(bellButton)
        
        NSLayoutConstraint.activate([
            bellButton.trailingAnchor.constraint(equalTo: navBar.trailingAnchor, constant: -70),
            bellButton.topAnchor.constraint(equalTo: navBar.bottomAnchor, constant: 10),
        ])
        
        let menuButton = UIButton()
        menuButton.setImage(UIImage(systemName: "ellipsis"), for: .normal)
        menuButton.tintColor = .black
        menuButton.translatesAutoresizingMaskIntoConstraints = false
        navBar.addSubview(menuButton)
        
        NSLayoutConstraint.activate([
            menuButton.leadingAnchor.constraint(equalTo: bellButton.trailingAnchor, constant: 20),
            menuButton.topAnchor.constraint(equalTo: navBar.bottomAnchor, constant: 10),
            
        ])
        
        let helloText = UILabel()
        helloText.text = "Hello Broooo, everything you will discover here"
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
        
        let searchBar = UISearchBar(frame: CGRect(x: 0, y: 120, width: view.frame.width, height: 44))
        navBar.addSubview(searchBar)

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
    
    @objc func didTapButton() {
        let vc = AddToCartViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func productdidTap() {
        let vc = ProductDetails()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func menuDidTap() {
        let vc = KanyeViewController()
        self.navigationController?.pushViewController(vc, animated: true)
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
            return ""
        case 5:
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
            cell.configure(with: self.products)
            cell.backgroundColor = .clear
            return cell
            
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: FeaturedProducts.reuseIdentifier, for: indexPath) as! FeaturedProducts
            cell.backgroundColor = .clear
            cell.configure(with: self.products)
            
            return cell
            
        
        case 3:
            let cell = tableView.dequeueReusableCell(withIdentifier: HotDealsOfTheDay.reuseIdentifier, for: indexPath) as! HotDealsOfTheDay
            cell.configure(with: self.products)
            cell.backgroundColor = .clear
            return cell
            
        case 4:
            let cell = tableView.dequeueReusableCell(withIdentifier: ImageCell.reuseIdentifier, for: indexPath) as! ImageCell
            let image = UIImage(named: "ecom") 
            cell.configure(with: image)
            cell.backgroundColor = .clear
            return cell
            
        case 5:
            let cell = tableView.dequeueReusableCell(withIdentifier: PopularBrand.reuseIdentifier, for: indexPath) as! PopularBrand
            cell.backgroundColor = .clear
            cell.configure(with: self.products)
            return cell
            
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: PopularBrand.reuseIdentifier, for: indexPath) as! PopularBrand
            cell.backgroundColor = .clear
            cell.configure(with: self.products)
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

