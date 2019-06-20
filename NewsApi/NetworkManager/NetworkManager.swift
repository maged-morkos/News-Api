//
//  TopHeadLines.swift
//  NewsApi
//
//  Created by Maged Morkos on 6/19/19.
//  Copyright © 2019 Maged Morkos. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireObjectMapper
import ObjectMapper

protocol reloadTopHeadLines {
    func reloadTopHeadLinesList(articleList : [ArticleModel])
    func loadingFailed()
}
class NetworkManager: NSObject {
    var delegate : reloadTopHeadLines?
    
    func getTopHeadLines() {

        let params = ["country" : "us", "apiKey" : "69e93f18352f4c86b2d36a2ee53a5304"]
        Alamofire.request(ApiUrls.topHeadLines.url, method: .get, parameters: params).responseObject { (response: DataResponse<TopHeadLinesModel>) in
            if let topHeadLineResponse = response.result.value{
                if topHeadLineResponse.status == "ok"{
                    self.delegate?.reloadTopHeadLinesList(articleList: topHeadLineResponse.articlesList!)
                }else{
                    self.delegate?.loadingFailed()
                }
            }else{
                self.delegate?.loadingFailed()
            }
        }
    }
}
