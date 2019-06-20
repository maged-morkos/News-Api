//
//  TopHeadLines.swift
//  NewsApi
//
//  Created by Maged Morkos on 6/19/19.
//  Copyright © 2019 Maged Morkos. All rights reserved.
//

import UIKit
import ObjectMapper
class TopHeadLinesModel: Mappable {
    var status : String?
    var articlesList : [ArticleModel]?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        status <- map["status"]
        articlesList <- map["articles"]
    }
    
    

}
