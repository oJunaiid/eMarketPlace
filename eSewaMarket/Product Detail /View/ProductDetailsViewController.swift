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
    
    
    
    let footer = UIView()
    let checkOutLabel = UILabel()
    let checkOutPrice = UILabel()
    let checkOutButton = UIButton()
    let backButton = UIButton(type: .system)
    let cartButton = UIButton(type: .system)
    let tableView = UITableView()

//    var descriptionCell: ImageDescriptionViewCell?

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTableView()
        view.addSubview(tableView)
        view.addSubview(footer)
        footer.addSubview(checkOutLabel)
        footer.addSubview(checkOutPrice)
        footer.addSubview(checkOutButton)
        
        view.backgroundColor = .clear
        
        tableView.backgroundColor = UIColor(named: "color1")
        tableView.delegate = self
        tableView.dataSource = self
        tableView.frame = CGRect(x: 0, y: 0, width: view.bounds.size.width, height: view.bounds.size.height - 60)

        
        checkOutLabel.text = "Checkout Total"
        checkOutLabel.textColor = .black
        checkOutLabel.font = .systemFont(ofSize: 16)
        
        footer.backgroundColor = .white
        
        checkOutPrice.text = "$1000"
        checkOutPrice.textColor = .black
        checkOutPrice.font = .systemFont(ofSize: 14)
        
        
        checkOutButton.setTitle("ADD TO CART", for: .normal)
        checkOutButton.backgroundColor = .black
        checkOutButton.tintColor = .white
        checkOutButton.layer.cornerRadius = 10
        
        //  nav back button
        
        backButton.setImage(UIImage(systemName: "arrow.backward"), for: .normal)
        backButton.translatesAutoresizingMaskIntoConstraints = false
        backButton.tintColor = .black
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: backButton)
        
        navigationItem.title = "Product Detail"
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black, NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 14)]
        
      
        cartButton.setImage(UIImage(systemName: "cart"), for: .normal)
        cartButton.tintColor = .black
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: cartButton)

        backButton.addTarget(self, action: #selector(backTapped), for: .touchUpInside)
        
        footer.translatesAutoresizingMaskIntoConstraints = false
        checkOutLabel.translatesAutoresizingMaskIntoConstraints = false
        checkOutButton.translatesAutoresizingMaskIntoConstraints = false
        checkOutPrice.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            footer.leadingAnchor.constraint(equalTo: tableView.leadingAnchor, constant: 0),
            footer.trailingAnchor.constraint(equalTo: tableView.trailingAnchor),
            footer.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            footer.heightAnchor.constraint(equalToConstant: 60),
            
            checkOutLabel.topAnchor.constraint(equalTo: footer.topAnchor, constant: 10),
            checkOutLabel.leadingAnchor.constraint(equalTo: footer.leadingAnchor, constant: 20),
            
            checkOutPrice.topAnchor.constraint(equalTo: checkOutLabel.bottomAnchor, constant: 5),
            checkOutPrice.leadingAnchor.constraint(equalTo: footer.leadingAnchor, constant: 20),
            
            checkOutButton.topAnchor.constraint(equalTo: footer.topAnchor, constant: 10),
            checkOutButton.trailingAnchor.constraint(equalTo: footer.trailingAnchor, constant: -20),
            checkOutButton.heightAnchor.constraint(equalToConstant: 30),
            checkOutButton.widthAnchor.constraint(equalToConstant: 120),
        ])
        
        
        tableView.register(ProductImage.self, forCellReuseIdentifier: ProductImage.reuseIdentifier)
        tableView.register(ImageDescriptionViewCell.self, forCellReuseIdentifier: ImageDescriptionViewCell.reuseIdentifier)
        tableView.register(DescriptionTableViewCell.self, forCellReuseIdentifier: DescriptionTableViewCell.reuseIdentifier)
            
        
    }
    
    func configure(with products: ProductModel) {
//        descriptionCell?.configure(with: products)
        checkOutLabel.text = products.title
        checkOutPrice.text = "$\(products.price ?? 0)"
    }
    
    private func setupTableView() {

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
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        switch section {
        case 0:
            return 0.0
        case 1:
            return 0.0
        case 2:
            return UITableView.automaticDimension
        default:
            return  0.0
            
        }
       
    }
//
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0:
            return UITableView.automaticDimension
        case 1:
            return 90
        case 2:
            return 200
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
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        if section == 0 || section == 1 {
            view.isHidden = true
            view.frame = .zero
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: ProductImage.reuseIdentifier, for: indexPath) as! ProductImage

            if let apiData = apiData {
                cell.configure(with: apiData)
            }
            cell.backgroundColor = .clear
            return cell
            
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: ImageDescriptionViewCell.reuseIdentifier, for: indexPath) as! ImageDescriptionViewCell
        
            if let apiData = apiData {
                cell.configure(with: apiData)
            }
//            descriptionCell = cell

            cell.backgroundColor = .clear
            return cell
            
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: DescriptionTableViewCell.reuseIdentifier, for: indexPath) as! DescriptionTableViewCell
       
            if let featuredData = apiData {
                cell.configure(with: featuredData)
            }
            cell.backgroundColor = .clear

            return cell
            
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: ImageDescriptionViewCell.reuseIdentifier, for: indexPath) as! ImageDescriptionViewCell
            return cell
            
        }
    }
    
    
}
