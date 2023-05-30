//
//  ViewController.swift
//  eSewaMarket
//
//  Created by Omar  on 4/12/23.
//

import UIKit
class HomeController: UIViewController, UIScrollViewDelegate, HomePresenterProtocol {
    
    var presenter: HomePresenter?
    var Cpresenter: categoryClass?
    var products = [ProductModel]()
    var categories: [CategorieModel]?
    let tableView = UITableView()
    let searchController = UISearchController(searchResultsController: nil)
    let addToCartVC = AddToCartViewController()
    
    
    let footer = UIView()
    let homeButton = UIButton()
    let cartButton = UIButton()
    let heartButton = UIButton()
    let bottomMenuButton = UIButton()
    
    let logoImage = UIImageView(image: UIImage(named: "eMarket"))
    let bellButton = UIButton()
    let menuButton = UIButton()
    let helloText = UILabel()
    
    let searchBar = UISearchBar(frame: CGRect(x: 0, y: 120, width: 200, height: 44))
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.showsVerticalScrollIndicator = false
        view.backgroundColor = .white
        setupViews()
        presenter = (HomePresenter(delegate: self))
        Cpresenter = (categoryClass(view: self, delegate: self))
        presenter?.fetch()
        Cpresenter?.populateDescriptionView()
        // presenter?.fetchC()
        
        footer.backgroundColor = .lightGray
        footer.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(footer)
        
        homeButton.setImage(UIImage(systemName: "house"), for: .normal)
        homeButton.setTitleColor(.black, for: .normal)
        homeButton.tintColor = .white
        homeButton.translatesAutoresizingMaskIntoConstraints = false
        footer.addSubview(homeButton)
        
        cartButton.setImage(UIImage(systemName: "cart"), for: .normal)
        cartButton.setTitleColor(.black, for: .normal)
        cartButton.tintColor = .white
        cartButton.translatesAutoresizingMaskIntoConstraints = false
        footer.addSubview(cartButton)
        
        heartButton.setImage(UIImage(systemName: "heart"), for: .normal)
        heartButton.tintColor = .white
        heartButton.setTitleColor(.black, for: .normal)
        heartButton.translatesAutoresizingMaskIntoConstraints = false
        footer.addSubview(heartButton)
        
        bottomMenuButton.setImage(UIImage(systemName: "ellipsis"), for: .normal)
        bottomMenuButton.setTitleColor(.black, for: .normal)
        bottomMenuButton.tintColor = .white
        bottomMenuButton.translatesAutoresizingMaskIntoConstraints = false
        footer.addSubview(bottomMenuButton)
        
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
            
            bottomMenuButton.trailingAnchor.constraint(equalTo: footer.trailingAnchor, constant: -20),
            bottomMenuButton.centerYAnchor.constraint(equalTo: footer.centerYAnchor)
        ])
        
        cartButton.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        heartButton.addTarget(self, action: #selector(productdidTap), for: .touchUpInside)
    }
    
    func didFetchProducts(with products: [ProductModel]) {
        self.products = products
        tableView.reloadData()
    }
    func didFetchCategorie(model category: [CategorieModel]) {
        self.categories = category
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
        tableView.backgroundColor = UIColor(named: "color1")
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        
        tableView.register(AdBannerCell.self, forCellReuseIdentifier: AdBannerCell.reuseIdentifier)
        tableView.register(CategoriesSection.self, forCellReuseIdentifier: CategoriesSection.reuseIdentifier)
        tableView.register(FeaturedProducts.self, forCellReuseIdentifier: FeaturedProducts.reuseIdentifier)
        tableView.register(HotDealsOfTheDay.self, forCellReuseIdentifier: HotDealsOfTheDay.reuseIdentifier)
        tableView.register(ImageCell.self, forCellReuseIdentifier: ImageCell.reuseIdentifier)
        tableView.register(PopularBrand.self, forCellReuseIdentifier: PopularBrand.reuseIdentifier)
        tableView.register(RecommendedForYou.self, forCellReuseIdentifier: RecommendedForYou.reuseIdentifier)

        // Navigation Bar
        let navBar = UINavigationBar(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 44))
        view.addSubview(navBar)
        
        logoImage.contentMode = .scaleAspectFit
        logoImage.translatesAutoresizingMaskIntoConstraints = false
        navBar.addSubview(logoImage)
        
        NSLayoutConstraint.activate([
            logoImage.leadingAnchor.constraint(equalTo: navBar.leadingAnchor, constant: 20),
            logoImage.topAnchor.constraint(equalTo: navBar.topAnchor, constant: 20),
            logoImage.heightAnchor.constraint(equalToConstant: 90),
            logoImage.widthAnchor.constraint(equalToConstant: 180)
        ])
        
        bellButton.setImage(UIImage(systemName: "bell"), for: .normal)
        bellButton.tintColor = .black
        bellButton.translatesAutoresizingMaskIntoConstraints = false
        navBar.addSubview(bellButton)
        
        NSLayoutConstraint.activate([
            bellButton.trailingAnchor.constraint(equalTo: navBar.trailingAnchor, constant: -70),
            bellButton.topAnchor.constraint(equalTo: navBar.bottomAnchor, constant: 10),
        ])
        
        menuButton.setImage(UIImage(systemName: "ellipsis"), for: .normal)
        menuButton.tintColor = .black
        menuButton.translatesAutoresizingMaskIntoConstraints = false
        navBar.addSubview(menuButton)
        
        NSLayoutConstraint.activate([
            menuButton.leadingAnchor.constraint(equalTo: bellButton.trailingAnchor, constant: 20),
            menuButton.topAnchor.constraint(equalTo: navBar.bottomAnchor, constant: 10),
            
        ])
        
        helloText.text = "Hello Kiran, everything you will discover here"
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
        
        searchBar.placeholder = "Search For Everything Here"
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        navBar.addSubview(searchBar)
        
        NSLayoutConstraint.activate([
            searchBar.topAnchor.constraint(equalTo: helloText.bottomAnchor, constant: 10),
            searchBar.leadingAnchor.constraint(equalTo: navBar.leadingAnchor, constant: 10),
            searchBar.trailingAnchor.constraint(equalTo: navBar.trailingAnchor, constant: -10),
            searchBar.heightAnchor.constraint(equalToConstant: 44)
        ])
        view.addSubview(tableView)
        tableView.allowsSelection = false
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            tableView.topAnchor.constraint(equalTo: searchBar.bottomAnchor, constant: 5),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -45)
        ])
        
    }
    
    @objc func didTapButton() {
        let vc = AddToCartViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func productdidTap() {
        let vc = ProductDetails()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}

extension HomeController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 7
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    internal func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let headerView = UIView()
        headerView.backgroundColor = UIColor(named: "color1")
        
        let titleLabel = UILabel()
        titleLabel.font = UIFont.boldSystemFont(ofSize: 16)
        titleLabel.textColor = .black
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        headerView.addSubview(titleLabel)
        
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: headerView.leadingAnchor, constant: 16),
            titleLabel.centerYAnchor.constraint(equalTo: headerView.centerYAnchor),
        ])
        
        switch section {
        case 1:
            titleLabel.text = "Categories"
        case 2:
            titleLabel.text = "Featured Products"
        case 3:
            titleLabel.text = "Hot Deals Of TheDay"
        case 5:
            titleLabel.text = "Popular Brand"
        case 6:
            titleLabel.text = "Recommended For You"
        default:
            titleLabel.text = nil
        }
        return headerView
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        if section == 0 || section == 4 {
            view.isHidden = true
            view.frame = .zero
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
            if let products = categories {
                cell.configure(with: products)
                cell.backgroundColor = .clear
            }
            
            return cell
            
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: FeaturedProducts.reuseIdentifier, for: indexPath) as! FeaturedProducts
            cell.configure(with: self.products)
            cell.itemClicked = { item in
                let vc = ProductDetails()
                vc.apiData = item
                self.navigationController?.pushViewController(vc, animated: true)
            }
            
            cell.addedToCart = {[weak self] item in
                guard let strongSelf = self else {return}
                strongSelf.addToCartVC.selectedProduct = item
                strongSelf.navigationController?.pushViewController(strongSelf.addToCartVC, animated: true)
            }
            
            cell.backgroundColor = .clear
            
            return cell
            
            
        case 3:
            let cell = tableView.dequeueReusableCell(withIdentifier: HotDealsOfTheDay.reuseIdentifier, for: indexPath) as! HotDealsOfTheDay
            cell.configure(with: self.products)
            cell.itemClicked = { item in
                let vc = ProductDetails()
                vc.apiData = item
                self.navigationController?.pushViewController(vc, animated: true)
            }
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
            
            cell.configure(with: self.products)
            cell.itemClicked = { item in
                let vc = ProductDetails()
                vc.apiData = item
                self.navigationController?.pushViewController(vc, animated: true)
            }
            cell.backgroundColor = .clear
            return cell
            
        case 6:
            let cell = tableView.dequeueReusableCell(withIdentifier: RecommendedForYou.reuseIdentifier, for: indexPath) as! RecommendedForYou
            
            cell.configure(with: self.products)
            cell.itemClicked = { item in
                let vc = ProductDetails()
                vc.apiData = item
                self.navigationController?.pushViewController(vc, animated: true)
            }
            cell.backgroundColor = .clear
            return cell
            
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: RecommendedForYou.reuseIdentifier, for: indexPath) as! RecommendedForYou
            cell.backgroundColor = .clear
            cell.configure(with: self.products)
            return cell
        }
    }
//
//    func addToCart(_ product: ProductModel) {
//        let vc = AddToCartViewController()
//        vc.selectedProduct = product
//        present(vc, animated: true, completion: nil)
//
//    }
//
    
}
extension HomeController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        func setSelected(_ selected: Bool, animated: Bool) {
            // Do not call super implementation to prevent highlighting
        }
    }
    
}
extension AdBannerCell: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let pageIndex = Int(scrollView.contentOffset.x / scrollView.frame.width)
        pageControl.currentPage = pageIndex
    }
}

