//
//  ArticleModel.swift
//  NewsApi
//
//  Created by Maged Morkos on 6/19/19.
//  Copyright © 2019 Maged Morkos. All rights reserved.
//

import UIKit
import ObjectMapper
class ArticleModel: Mappable {
    
    var author : String?
    var title : String?
    var description : String?
    var url : String?
    var urlToImage : String?
    var publishedAt : String?
    var content : String?
    var source : SourceModel?
    
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        source      <- map["source"]
        author      <- map["author"]
        title       <- map["title"]
        description <- map["description"]
        url         <- map["url"]
        urlToImage  <- map["urlToImage"]
        publishedAt <- map["publishedAt"]
        content     <- map["content"]
    }
}

class SourceModel: Mappable {
    var sourceId : String?
    var sourceName : String?
    
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        sourceId <- map["id"]
        sourceName <- map["name"]
    }
    
    
}
