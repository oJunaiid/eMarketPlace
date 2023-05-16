//
//  rough.swift
//  eSewaMarket
//
//  Created by Omar  on 5/10/23.
//

import UIKit
import Alamofire
import SwiftyJSON
//
//class Product {
//    let id: Int
//    let title: String
//    let price: Double
//    let imageURL: String
//    
//    init(id: Int, title: String, price: Double, imageURL: String) {
//        self.id = id
//        self.title = title
//        self.price = price
//        self.imageURL = imageURL
//    }
//}
//
//class ProductTableViewCell: UITableViewCell {
//    static let identifier = "ProductTableViewCell"
//
//    private let productImageView: UIImageView = {
//        let imageView = UIImageView()
//        imageView.contentMode = .scaleAspectFit
//        imageView.clipsToBounds = true
//        return imageView
//    }()
//
//    private let titleLabel: UILabel = {
//        let label = UILabel()
//        label.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
//        label.numberOfLines = 0
//        return label
//    }()
//
//    private let priceLabel: UILabel = {
//        let label = UILabel()
//        label.font = UIFont.systemFont(ofSize: 14)
//        label.textColor = .gray
//        return label
//    }()
//
//    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
//        super.init(style: style, reuseIdentifier: reuseIdentifier)
//        contentView.addSubview(productImageView)
//        contentView.addSubview(titleLabel)
//        contentView.addSubview(priceLabel)
//    }
//
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//
//    override func layoutSubviews() {
//        super.layoutSubviews()
//        let imageSize: CGFloat = contentView.frame.size.height - 10
//        productImageView.frame = CGRect(x: 10, y: 5, width: imageSize, height: imageSize)
//        titleLabel.frame = CGRect(x: productImageView.frame.origin.x + imageSize + 10,
//                                  y: 0,
//                                  width: contentView.frame.size.width - imageSize - 20,
//                                  height: contentView.frame.size.height / 2)
//        priceLabel.frame = CGRect(x: productImageView.frame.origin.x + imageSize + 10,
//                                  y: contentView.frame.size.height / 2,
//                                  width: contentView.frame.size.width - imageSize - 20,
//                                  height: contentView.frame.size.height / 2)
//    }
//
//   [ func configure(with product: Product) {
//        titleLabel.text = product.title
//        priceLabel.text = "$\(product.price)"
//        if let url = URL(string: product.imageURL) {
//            DispatchQueue.global().async {
//                if let data = try? Data(contentsOf: url) {
//                    DispatchQueue.main.async {
//                        self.productImageView.image = UIImage(data: data)
//                    }
//                }
//            }
//        }
//    }
//}]


//class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
//    private let tableView: UITableView = {
//        let tableView = UITableView()
//        tableView.register(ProductTableViewCell.self, forCellReuseIdentifier: ProductTableViewCell.identifier)
//        return tableView
//    }()
//
//
//[
//    private var products: [Product] = []
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        view.addSubview(tableView)
//        tableView.delegate = self
//        tableView.dataSource = self
//        tableView.frame = view.bounds
//        tableView.separatorStyle = .none
//        fetchProducts()
//    }
//
//    private func fetchProducts() {
//        let url = "https://fakestoreapi.com/products"
//        AF.request(url).responseJSON { response in
//            switch response.result {
//            case .success(let value):
//                let json = JSON(value)
//                if let productsJSON = json.array {
//                    self.products = []
//                    for productJSON in productsJSON {
//                        if let product = self.parseProductJSON(productJSON: productJSON) {
//                            self.products.append(product)
//                        }
//                    }
//                    self.tableView.reloadData()
//                }
//            case .failure(let error):
//                                print(error.localizedDescription)
//                            }
//                        }
//                    }
//
//                    // MARK: - Table view data source
//
//                    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//                        return products.count
//                    }
//
//                    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//                        let cell = tableView.dequeueReusableCell(withIdentifier: "ProductCell", for: indexPath) as! ProductCell
//                        let product = products[indexPath.row]
//                        cell.titleLabel.text = product.title
//                        cell.priceLabel.text = "$\(product.price)"
//                        cell.productImageView.setImage(from: product.imageUrl)
//                        return cell
//                    }
//                }
//]
