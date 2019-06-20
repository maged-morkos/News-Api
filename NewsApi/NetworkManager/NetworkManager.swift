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
//    typealias apiCompleation =  (_ success: Bool, _ dataModel: MostPopularResultList) -> Void
    
//    func getMostViewdArticals(completionHandler: @escaping apiCompleation) {
//        let params = ["api-key" : "UHpPLuDPB8rLG4hASGDxvd2TEg9jTb7Z"]
//        Alamofire.request(ApiUrls.mostViewd.url,parameters: params, encoding: URLEncoding(destination: .queryString)).responseObject { (response: DataResponse<MostPopularResultList>) in
//            if let mostPopularResponse = response.result.value{
//                if mostPopularResponse.results!.count > 0{
//                    completionHandler(true, mostPopularResponse)
//                }else{
//                    completionHandler(false, mostPopularResponse)
//                }
//            }
//        }
//    }
}
