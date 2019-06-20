//
//  NewsListViewController.swift
//  NewsApi
//
//  Created by Maged Morkos on 6/19/19.
//  Copyright © 2019 Maged Morkos. All rights reserved.
//

import UIKit
import MBProgressHUD
class NewsListViewController: UIViewController {
    // Outlet Section
    @IBOutlet weak var newsTableView: UITableView!
    
    // Global Variable Section
    var refreshControl = UIRefreshControl()
    var articlesList : [ArticleModel] = []
    
    // life cycle section
    override func viewDidLoad() {
        super.viewDidLoad()
        MBProgressHUD.showAdded(to: self.view, animated: true)
        getTopHeadLines()
        initPullToRefresh()
    }
    // Helper Methods
    func getTopHeadLines() {
        let networkManager = NetworkManager()
            networkManager.delegate = self
            networkManager.getTopHeadLines()
    }
    
    func initPullToRefresh() {
        refreshControl.attributedTitle = NSAttributedString(string: "Powered by NewsApi.org")
        refreshControl.addTarget(self, action: #selector(refresh(sender:)), for: UIControl.Event.valueChanged)
        newsTableView.addSubview(refreshControl)
    }
    @objc func refresh(sender:AnyObject) {
        getTopHeadLines()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "NewsDetails" {
            let articleModel = sender as! ArticleModel
            let newsDetailsView = segue.destination as! NewsDetailsViewController
            newsDetailsView.articleModel = articleModel
        }
    }
}

extension NewsListViewController : reloadTopHeadLines{
    func reloadTopHeadLinesList(articleList: [ArticleModel]) {
        MBProgressHUD.hide(for: self.view, animated: true)
        self.articlesList = articleList
        self.newsTableView.reloadData()
        refreshControl.endRefreshing()
    }
    
    func loadingFailed() {
        MBProgressHUD.hide(for: self.view, animated: true)
        refreshControl.endRefreshing()
    }
    
    
}

extension NewsListViewController : UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let articleModel = articlesList[indexPath.row]
        self.performSegue(withIdentifier: "NewsDetails", sender: articleModel)
    }
}
extension NewsListViewController : UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articlesList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "newsCell", for: indexPath) as! NewsTableViewCell
        let articleModel = articlesList[indexPath.row]
        cell.setCellData(articleModel: articleModel)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    
}

