//
//  Api.swift
//  eSewaMarket
//
//  Created by Omar  on 5/12/23.
//

import Foundation
import Alamofire
import SwiftyJSON
import Kingfisher

protocol Api {
    var baseUrl: String {get}
    
    var url: String {get}
    
    var httpMethod: HTTPMethod {get}
    
    var encoding: ParameterEncoding {get}
    
    var parameters: [String: Any]? {get}
    
    var headers: HTTPHeader? {get}
}

extension Api {
    var baseUrl: String {
        return "https://fakestoreapi.com/"
    }
    var headers: HTTPHeaders {
        return [
            "Content -type": "application/json"
        ]
    }
}
