//
//  AddToCartViewController.swift
//  eSewaMarket
//
//  Created by Omar  on 4/27/23.
//


import UIKit
import Kingfisher

class AddToCartViewController: UIViewController, AddToCartProtocol {
    
    var items: [AddCartModel]?
    
//    let totalPriceLabel = UILabel()

//    var totalPrice: Double = 0.0
//    var totalPriceClosure: ((Double) -> Void)?

    
    var presenter: AddCartItemPresenter!
  
        // Create a table View
        private let tableView: UITableView = {
        let table = UITableView()
        table.backgroundColor = .systemBackground
        table.register(AddToCartViewCell.self, forCellReuseIdentifier: AddToCartViewCell.identifier)
        return table
        }()
    
        private let footerView: UIView = {
        let footerColor = UIView()
        footerColor.backgroundColor = .white
        return footerColor
    }()
    
        private let checkoutLabel: UILabel = {
        let labelCheckOut = UILabel()
        labelCheckOut.text = "Checkout Total"
        labelCheckOut.textColor = .black
        labelCheckOut.font = .systemFont(ofSize: 18)
        return labelCheckOut
    }()
    
    private let checkoutPrice: UILabel = {
    let checkoutPrice = UILabel()
        checkoutPrice.text = "$ 1000"
        checkoutPrice.textColor = .black
        checkoutPrice.font = .systemFont(ofSize: 16)
    return checkoutPrice
        
    }()
    
    private let checkoutButton: UIButton = {
        let button = UIButton()
        button.setTitle("CHECKOUT", for: .normal)
        button.backgroundColor = .black
        button.tintColor = .white
        button.layer.cornerRadius = 10
        return button
    }()
    
        override func viewDidLoad() {
            super.viewDidLoad()
            
            // Initialize the presenter with the view controller as the delegate
            presenter = AddCartItemPresenter(view: self, delegate: self)
            
            // Populate the table view with data
            presenter?.populateTableView()
        
            navigationItem.title = "My Cart"
            
            // Create a back button
            let backButton = UIButton(type: .system)
            backButton.setImage(UIImage(systemName: "arrow.backward"), for: .normal)
            backButton.addTarget(self, action: #selector(backTapped), for: .touchUpInside)
            backButton.translatesAutoresizingMaskIntoConstraints = false
            backButton.tintColor = .black
               // Add the back button to the navigation item
            navigationItem.leftBarButtonItem = UIBarButtonItem(customView: backButton)
               
               // Add the navigation item to the navigation bar
            let cartButton = UIButton(type: .system)
            cartButton.setImage(UIImage(systemName: "cart"), for: .normal)
            cartButton.addTarget(self, action: #selector(cartTap), for: .touchUpInside)
            cartButton.tintColor = .black

            navigationItem.rightBarButtonItem = UIBarButtonItem(customView: cartButton)
            
            footerView.translatesAutoresizingMaskIntoConstraints = false
            checkoutLabel.translatesAutoresizingMaskIntoConstraints = false
            checkoutButton.translatesAutoresizingMaskIntoConstraints = false
            checkoutPrice.translatesAutoresizingMaskIntoConstraints = false
        
            // add tableview to view
            view.addSubview(tableView)
            view.addSubview(footerView)
            view.addSubview(checkoutLabel)
            view.addSubview(checkoutButton)
            view.addSubview(checkoutPrice)
            

            tableView.delegate = self
            tableView .dataSource = self

            
            NSLayoutConstraint.activate([
                footerView.leadingAnchor.constraint(equalTo: tableView.leadingAnchor),
                footerView.trailingAnchor.constraint(equalTo: tableView.trailingAnchor),
                footerView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
                footerView.heightAnchor.constraint(equalToConstant: 120)
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
        }

    // Handle back button tap
    @objc func backTapped() {
        navigationController?.popViewController(animated: true)
    }
    @objc func cartTap() {
        navigationController?.popViewController(animated: true)
    }

        override func viewDidLayoutSubviews() {
            super.viewDidLayoutSubviews()
            tableView.frame = view.bounds
            tableView.backgroundColor = UIColor(named: "Color")
            tableView.separatorStyle = .none
            
        }
    
    func displayItemList(model: [AddCartModel]) {
        items = model
        tableView.reloadData()
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
                self.presenter.items.remove(at: indexPath.row)
                tableView.deleteRows(at: [indexPath], with: .middle)
                vc.dismiss(animated: true) {
                    self.tableView.reloadData()
                    print(deletedMessage)
                }
            }
            vc.onCancel = {
                vc.dismiss(animated: true, completion: nil)
            }
                vc.modalPresentationStyle = .popover
                self.present(vc, animated: true)
                
            }
    }


    extension AddToCartViewController: UITableViewDataSource {
        
        func numberOfSections(in tableView: UITableView) -> Int {
            return 1
        }
        
        func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
            return "items (\(presenter.items.count))"
        }
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return presenter.items.count
        }

        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: AddToCartViewCell.identifier, for: indexPath) as! AddToCartViewCell
            
            // Configure the cell with the item data
                let item = presenter.items[indexPath.row]
                cell.titleLabel.text = item.itemName
                cell.descriptionLabel.text = item.itemDesc
                cell.image.image = item.itemImage
                cell.priceLabel.text = "Rs.\(item.itemPrice ?? 00)"
                cell.quantityLabel.text = "\(item.totalItemCount ?? 1)"
            

            return cell
        } 
     
        func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return 130
        }
        func configureProductCell(_ cell: AddToCartViewCell, for indexPath: IndexPath) {
                
                // Configure the cell here...
                
//                cell.updatedPrice = { [weak self] totalPrice in
                    // Update the UI with the total price
//                    self?.checkoutPrice.text = String(format: "Rs.%.2f", totalPrice)
                }
            }
    
    











