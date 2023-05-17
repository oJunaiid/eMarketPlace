//
//  HomePresenter.swift
//  eSewaMarket
//
//  Created by Omar  on 5/7/23.

    
import Foundation
import Alamofire
import SwiftyJSON
import Kingfisher

//var presenter: BannerPresenter?

protocol HomePresenterProtocol: AnyObject {
    func didFetchModel(with products: [ProductModel])
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
                    self?.delegate?.didFetchModel(with: products)
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


//    func fetch() {
//        fetchProducts() { [weak self] result in
//            switch result {
//            case .success(let products):
//
//                self?.delegate?.didFetchModel(with: products)
//            case .failure(let error):
//                self?.delegate?.showError(error.localizedDescription)
//            }
//        }
//
//    }
//
//    func fetchProducts(completion: @escaping (Result<[ProductModel], AFError>) -> Void) {
//        let url = "\(baseURL)products"
//        AF.request(url).validate().responseDecodable(of: [ProductModel].self) { response in
//            switch response.result {
//            case .success(let products):
//                completion(.success(products))
//                self.delegate?.didFetchModel(with: products)
//            case .failure(let error):
//                completion(.failure(error))
//            }
//        }
//    }
//}


//class BannerPresenter {
//
//    var items = [BannerImage(image: UIImage(named: "image1")), BannerImage(image: UIImage(named: "image2")), BannerImage(image: UIImage(named: "image3")), BannerImage(image: UIImage(named: "image4"))]
//
//    weak var view: HomeController?
//
//    init(view: HomeController) {
//        self.view = view
//
//    }
//}
