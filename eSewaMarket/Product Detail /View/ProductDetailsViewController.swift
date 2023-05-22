//
//  View.swift
//  eSewaMarket
//
//  Created by Omar  on 5/3/23.
//

import UIKit

class ProductDetails: UIViewController, ProductDescriptionProtocol {
    
    var presenter: ProductInfoPresenter!
    
    private let tableView: UITableView = {
        let table = UITableView()
        
        table.register(ProductImage.self, forCellReuseIdentifier: ProductImage.reuseIdentifier)
        table.register(ImageDescriptionViewCell.self, forCellReuseIdentifier: ImageDescriptionViewCell.reuseIdentifier)
        table.register(DescriptionTableViewCell.self, forCellReuseIdentifier: DescriptionTableViewCell.reuseIdentifier)
        
        return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter = ProductInfoPresenter(view: self, delegate: self)
        
        presenter.populateDescriptionView()
        
        setupTableView()
        
        
        //  nav back button
        let backButton = UIButton(type: .system)
        backButton.setImage(UIImage(systemName: "arrow.backward"), for: .normal)
        //        backButton.addTarget(self, action: #selector(backTapped), for: .touchUpInside)
        backButton.translatesAutoresizingMaskIntoConstraints = false
        backButton.tintColor = .black
        // Add the back button to the navigation item
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: backButton)
        
        navigationItem.title = "Product Detail"
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black, NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 14)]
        

        // Add to cart Navigation
        let cartButton = UIButton(type: .system)
        cartButton.setImage(UIImage(systemName: "cart"), for: .normal)
        //        cartButton.addTarget(self, action: #selector(cartTap), for: .touchUpInside)
        cartButton.tintColor = .black
        //Adding the right button to navigation item
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: cartButton)
        
        
        backButton.addTarget(self, action: #selector(backTapped), for: .touchUpInside)
        
        //        tableView.register(ProductImage.self, forCellReuseIdentifier: ProductImage.identifier)
        
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.backgroundColor = .white
        //        tableView.frame = view.bounds
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
        ])
        
        
    }
    
    func displayProductDescription(model: [ProductDescriptionModel]) {
        tableView.reloadData()
    }
    private func setupTableView() {
        
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 100
        // pin the table view to the vc's root view
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
            return UITableView.automaticDimension
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
            let product = presenter?.description.first
            cell.productImage.image = product?.itemImage
            return cell
            
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: ImageDescriptionViewCell.reuseIdentifier, for: indexPath) as! ImageDescriptionViewCell
            let product = presenter?.description.first
            cell.descriptionLabel.text = product?.itemName
            cell.priceLabel.text = String(format: "$.%.2f", product?.itemPrice ?? 0.0)
            return cell
            
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: DescriptionTableViewCell.reuseIdentifier, for: indexPath) as! DescriptionTableViewCell
            let productDescriptions = presenter?.description ?? []
            productDescriptions.forEach { description in
                cell.addRandomDescription()
            }
            return cell
            
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: ImageDescriptionViewCell.reuseIdentifier, for: indexPath) as! ImageDescriptionViewCell
            return cell
            
        }
    }
    
    
}
