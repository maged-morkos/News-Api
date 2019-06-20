//
//  TopHeadLines.swift
//  NewsApi
//
//  Created by Maged Morkos on 6/19/19.
//  Copyright © 2019 Maged Morkos. All rights reserved.
//

import Foundation
enum ApiUrls {
    case topHeadLines
}
extension ApiUrls: Endpoint {
    var base: String {
        return "https://newsapi.org"
    }
    
    var path: String {
        switch self {
        // add more cases if there are more urls available
        case .topHeadLines: return "/v2/top-headlines"
        }
    }
}
