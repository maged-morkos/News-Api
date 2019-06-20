//
//  TopHeadLines.swift
//  NewsApi
//
//  Created by Maged Morkos on 6/19/19.
//  Copyright © 2019 Maged Morkos. All rights reserved.
//

import Foundation

protocol Endpoint {
    var base: String { get }
    var path: String { get }
}
extension Endpoint {
    
    var urlComponents: URLComponents {
        var components = URLComponents(string: base)!
        components.path = path
        return components
    }
    
    var request: URLRequest {
        let url = urlComponents.url!
        return URLRequest(url: url)
    }
    
    var url: URL{
     return urlComponents.url!
    }
    
}
