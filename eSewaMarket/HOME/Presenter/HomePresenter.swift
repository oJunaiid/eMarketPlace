//
//  HomePresenter.swift
//  eSewaMarket
//
//  Created by Omar  on 5/7/23.

    
import Foundation
import Alamofire
import SwiftyJSON
import Kingfisher

protocol HomePresenterProtocol: AnyObject {
    func didFetchProducts(with products: [ProductModel])
    func didFetchCategorie(model: [CategorieModel])

    func showError(_ message: String)
}
     let baseURL = "https://fakestoreapi.com/"

class HomePresenter {
    weak var delegate: HomePresenterProtocol?

    init(delegate: HomePresenterProtocol) {
        self.delegate = delegate
    }
    func fetch() {
            fetchProducts {[weak self] result in
                switch result {
                case .success(let products):
                    print(products)
                    self?.delegate?.didFetchProducts(with: products)
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
        }
        
        func fetchProducts(completion: @escaping (Result<[ProductModel], Error>) -> Void) {
    //        let url = "\(baseURL)products"
            let url = URL(string: "https://fakestoreapi.com/products")
            AF.request(url!).responseJSON { response in
                switch response.result {
                case .success(let value):
                    let json = JSON(value)
                    let products = json.arrayValue.map { ProductModel(json: $0)}
                    completion(.success(products))
                case .failure(let error):
                    print("Error: \(error)")
                    completion(.failure(error))
                }
            }
        }
}

class categoryClass {
    
    var label = [CategorieModel(category: "electronics", imageName: UIImage(systemName: "iphone")), CategorieModel(category: "jewelery", imageName: UIImage(systemName: "tray.fill")), CategorieModel(category: "men's clothing", imageName: UIImage(systemName: "tshirt")), CategorieModel(category: "women's clothing", imageName: UIImage(systemName: "person.fill"))]
    
    weak var delegate: HomePresenterProtocol?
    
    weak var view: HomeController?
    
    init(view: HomeController, delegate: HomePresenterProtocol) {
        self.delegate = delegate
        self.view = view
    }
    
    func populateDescriptionView() {
        self.delegate?.didFetchCategorie(model: label)
    }
}

