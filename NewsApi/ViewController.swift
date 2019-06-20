//
//  ViewController.swift
//  NewsApi
//
//  Created by Maged Morkos on 6/19/19.
//  Copyright © 2019 Maged Morkos. All rights reserved.
//

import UIKit
import MBProgressHUD
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        getTopHeadLines()
    }
    
    func getTopHeadLines() {
        MBProgressHUD.showAdded(to: self.view, animated: true)
        let networkManager = NetworkManager()
            networkManager.delegate = self
            networkManager.getTopHeadLines()
    }
    
}

extension ViewController : reloadTopHeadLines{
    func reloadTopHeadLinesList(articleList: [ArticleModel]) {
        MBProgressHUD.hide(for: self.view, animated: true)
    }
    
    func loadingFailed() {
        MBProgressHUD.hide(for: self.view, animated: true)
    }
    
    
}

