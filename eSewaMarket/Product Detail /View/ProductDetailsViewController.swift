//
//  View.swift
//  eSewaMarket
//
//  Created by Omar  on 5/3/23.
//

import UIKit

class ProductDetails: UIViewController  {
    
    //    var presenter: ProductInfoPresenter!
    
    var apiData: ProductModel?
    
    private let tableView: UITableView = {
        let table = UITableView()
        
        table.register(ProductImage.self, forCellReuseIdentifier: ProductImage.reuseIdentifier)
        table.register(ImageDescriptionViewCell.self, forCellReuseIdentifier: ImageDescriptionViewCell.reuseIdentifier)
        table.register(DescriptionTableViewCell.self, forCellReuseIdentifier: DescriptionTableViewCell.reuseIdentifier)
        
        return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTableView()
        
        
        //  nav back button
        let backButton = UIButton(type: .system)
        backButton.setImage(UIImage(systemName: "arrow.backward"), for: .normal)
        backButton.translatesAutoresizingMaskIntoConstraints = false
        backButton.tintColor = .black
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: backButton)
        
        navigationItem.title = "Product Detail"
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black, NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 14)]
        
        
        // Add to cart Navigation
        let cartButton = UIButton(type: .system)
        cartButton.setImage(UIImage(systemName: "cart"), for: .normal)
        cartButton.tintColor = .black
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: cartButton)
        
        
        backButton.addTarget(self, action: #selector(backTapped), for: .touchUpInside)
        
        //        tableView.register(ProductImage.self, forCellReuseIdentifier: ProductImage.identifier)
        
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.backgroundColor = .white
        
        //        tableView.separatorStyle = .none
        
        //        tableView.frame = view.bounds
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
        ])
        
        
    }
    
    //    func displayProductDescription(model: [ProductDescriptionModel]) {
    //        tableView.reloadData()
    //    }
    
    private func setupTableView() {
        
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        
    }
    
    @objc func backTapped() {
        navigationController?.popViewController(animated: true)
    }
}


extension ProductDetails: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}

extension ProductDetails: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0:
            return UITableView.automaticDimension
        case 1:
            return 110
        case 2:
            return 100
        default:
            return 0
        }
    }
    
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = .clear
        
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
        case 0:
            titleLabel.text = nil
            
        case 1:
            titleLabel.text = nil
        case 2:
            titleLabel.text = "Description"
            
        default:
            titleLabel.text = nil
        }
        return headerView
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: ProductImage.reuseIdentifier, for: indexPath) as! ProductImage

            if let apiData = apiData {
                cell.configure(with: apiData)
            }
            return cell
            
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: ImageDescriptionViewCell.reuseIdentifier, for: indexPath) as! ImageDescriptionViewCell
        
            if let apiData = apiData {
                cell.configure(with: apiData)
            }
            return cell
            
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: DescriptionTableViewCell.reuseIdentifier, for: indexPath) as! DescriptionTableViewCell
       
            if let featuredData = apiData {
                cell.configure(with: featuredData)
            }
            return cell
            
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: ImageDescriptionViewCell.reuseIdentifier, for: indexPath) as! ImageDescriptionViewCell
            return cell
            
        }
    }
    
    
}
