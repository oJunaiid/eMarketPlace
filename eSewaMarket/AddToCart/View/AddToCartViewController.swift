//
//  AddToCartViewController.swift
//  eSewaMarket
//
//  Created by Omar  on 4/27/23.
//


import UIKit
import Kingfisher

class AddToCartViewController: UIViewController {
    
    var cartItems = [ProductModel]()
    
    var selectedProduct: ProductModel?
    
    let tableView: UITableView = {
        let table = UITableView()
        table.register(AddToCartViewCell.self, forCellReuseIdentifier: AddToCartViewCell.identifier)
        return table
    }()
    
    let footerView: UIView = {
        let footerColor = UIView()
        footerColor.backgroundColor = .white
        return footerColor
    }()
    
    let checkoutLabel: UILabel = {
        let labelCheckOut = UILabel()
        labelCheckOut.text = "Checkout Total"
        labelCheckOut.textColor = .black
        labelCheckOut.font = .systemFont(ofSize: 18)
        return labelCheckOut
    }()
    
    let checkoutPrice: UILabel = {
        let checkoutPrice = UILabel()
        checkoutPrice.text = "$1000"
        checkoutPrice.textColor = .black
        checkoutPrice.font = .systemFont(ofSize: 16)
        return checkoutPrice
        
    }()
    
    let checkoutButton: UIButton = {
        let button = UIButton()
        button.setTitle("CHECKOUT", for: .normal)
        button.backgroundColor = .black
        button.tintColor = .white
        button.layer.cornerRadius = 10
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.allowsSelection = false
        navigationItem.title = "My Cart"
        
      
        let backButton = UIButton(type: .system)
        backButton.setImage(UIImage(systemName: "arrow.backward"), for: .normal)
        backButton.addTarget(self, action: #selector(backTapped), for: .touchUpInside)
        backButton.translatesAutoresizingMaskIntoConstraints = false
        backButton.tintColor = .black
      
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: backButton)
        
      
        let cartButton = UIButton(type: .system)
        cartButton.setImage(UIImage(systemName: "cart"), for: .normal)
        cartButton.addTarget(self, action: #selector(cartTap), for: .touchUpInside)
        cartButton.tintColor = .black
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: cartButton)
        
        
        view.addSubview(tableView)
        view.addSubview(footerView)
        view.addSubview(checkoutLabel)
        view.addSubview(checkoutButton)
        //        view.addSubview(checkoutPrice)
        footerView.addSubview(checkoutPrice)
        
        
        tableView.delegate = self
        tableView .dataSource = self
        
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        footerView.translatesAutoresizingMaskIntoConstraints = false
        checkoutLabel.translatesAutoresizingMaskIntoConstraints = false
        checkoutButton.translatesAutoresizingMaskIntoConstraints = false
        checkoutPrice.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),            
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100),
        ])
        
        NSLayoutConstraint.activate([
            footerView.leadingAnchor.constraint(equalTo: tableView.leadingAnchor),
            footerView.trailingAnchor.constraint(equalTo: tableView.trailingAnchor),
            footerView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            footerView.heightAnchor.constraint(equalToConstant: 100)
        ])
        
        NSLayoutConstraint.activate([
            checkoutLabel.topAnchor.constraint(equalTo: footerView.topAnchor, constant: 10),
            checkoutLabel.leadingAnchor.constraint(equalTo: footerView.leadingAnchor, constant: 10),
        ])
        
        NSLayoutConstraint.activate([
            checkoutPrice.topAnchor.constraint(equalTo: checkoutLabel.bottomAnchor, constant: 5),
            checkoutPrice.leadingAnchor.constraint(equalTo: footerView.leadingAnchor, constant: 10),
            
        ])
        NSLayoutConstraint.activate([
            checkoutButton.topAnchor.constraint(equalTo: footerView.topAnchor, constant: 10),
            checkoutButton.trailingAnchor.constraint(equalTo: footerView.trailingAnchor, constant: -10),
            checkoutButton.heightAnchor.constraint(equalToConstant: 40),
            checkoutButton.widthAnchor.constraint(equalToConstant: 140),
        ])
        
        
        displayTotalPrice()
        
    }
    
    func calculateTotalPrice() -> Double {
        var totalPrice: Double = 0
        
        for item in cartItems {
            totalPrice += item.price ?? 0
        }
        
        return totalPrice
    }
    
    func displayTotalPrice() {
        let totalPrice = calculateTotalPrice()
        checkoutPrice.text = "$\(totalPrice)"
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if let prod = self.selectedProduct {
            if let existingItemIndex = cartItems.firstIndex(where: { $0.title == prod.title }) {
                cartItems[existingItemIndex].count += 1 // Increase the count for the existing item
            } else {
                cartItems.append(prod) // Append the item if it doesn't exist in cartItems
            }
            
            
            self.selectedProduct = nil // Reset selected product after adding it to cartItems
            
        }
        self.tableView.reloadData()
    }
    
    @objc func backTapped() {
        navigationController?.popViewController(animated: true)
    }
    @objc func cartTap() {
        navigationController?.popViewController(animated: true)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        //        tableView.frame = view.bounds
        tableView.backgroundColor = UIColor(named: "color1")
        tableView.separatorStyle = .none
        
        
    }
}

extension AddToCartViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("clicked cell at \(indexPath.row)")
    }
    
    // DELETE ROW WITH SWIPE ACTION
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        // show the delete pop up view
        let vc = DeleteConfirmationView()
        vc.onConfirm = { deletedMessage in
            self.cartItems.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .middle)
            vc.dismiss(animated: true) {
                self.tableView.reloadData()
                print(deletedMessage)
            }
        }
        vc.onCancel = {
            vc.dismiss(animated: true, completion: nil)
        }
        vc.modalPresentationStyle = .pageSheet
        self.present(vc, animated: true)
        
    }
}


extension AddToCartViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Items (\(cartItems.count))"
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cartItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: AddToCartViewCell.identifier, for: indexPath) as! AddToCartViewCell
        
        cell.configure(with: cartItems[indexPath.row])
        cell.priceChanged = { [weak self] (newPrice, count) in
            guard let self = self else {return}
            self.cartItems[indexPath.row].updatedPrice = newPrice
            self.cartItems[indexPath.row].count = count
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 130
    }
}











