//
//  View.swift
//  eSewaMarket
//
//  Created by Omar  on 5/3/23.
//

import UIKit

class ProductDetails: UIViewController, ProductDescriptionProtocol {
    
//    var items: [AddCartModel]?

    var presenter: ProductInfoPresenter!
    
    private let tableView: UITableView = {
    let table = UITableView()
        
    table.register(ProductImage.self, forCellReuseIdentifier: ProductImage.reuseIdentifier)
    table.register(ImageDescriptionViewCell.self, forCellReuseIdentifier: ImageDescriptionViewCell.reuseIdentifier)
    table.register(DescriptionTableViewCell.self, forCellReuseIdentifier: DescriptionTableViewCell.reuseIdentifier)
        
return table
}()

   var section = [0,1,2]
//    var modelList = [""]
    
    
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
   
}

extension ProductDetails: UITableViewDataSource {
   
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
           switch section {
           case 0:
               return ""
           case 1:
               return ""
           case 2:
               let name = NSAttributedString(string: "Description", attributes: [.foregroundColor: UIColor.blue])
             
               return name.string
           default:
              return nil
           }
    }
        
//    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
//        if section == 2 {
//            let footer = UIView()
//            footer.translatesAutoresizingMaskIntoConstraints = false
//
//
//
//
//            let button = UIButton()
//                    button.setTitle("View More", for: .normal)
//                    button.setTitleColor(.white, for: .normal)
//                    button.backgroundColor = .black
////            button.translatesAutoresizingMaskIntoConstraints = false
//
//                    button.addTarget(self, action: #selector(viewMoreButtonTapped), for: .touchUpInside)
//
//            NSLayoutConstraint.activate([
////                footer.topAnchor.constraint(equalTo: tableView.bottomAnchor, constant: 0),
////                footer.leadingAnchor.constraint(equalTo: tableView.leadingAnchor, constant: 0),
////                footer.trailingAnchor.constraint(equalTo: tableView.trailingAnchor, constant: 0),
//                footer.heightAnchor.constraint(equalToConstant: 44),
//
////                button.widthAnchor.constraint(equalToConstant: 300),
////                button.centerXAnchor.constraint(equalTo: footer.centerXAnchor)
//])
//                    footer.addSubview(button)
//
//                    return footer
//        }
//
//        return nil
//    }



    @objc func viewMoreButtonTapped() {
        // Handle button tap
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
            cell.priceLabel.text = String(format: "Rs.%.2f", product?.itemPrice ?? 0.0)
            return cell
        
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: DescriptionTableViewCell.reuseIdentifier, for: indexPath) as! DescriptionTableViewCell
            let productDescriptions = presenter?.description ?? []
//            cell.stackView.arrangedSubviews.forEach { $0.removeFromSuperview() } // remove existing views in the stack view
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
