//
//  NewsDetailsViewController.swift
//  NewsApi
//
//  Created by Maged Morkos on 6/20/19.
//  Copyright © 2019 Maged Morkos. All rights reserved.
//

import UIKit
import SafariServices

class NewsDetailsViewController: UIViewController {
    
    // Outlets Section
    @IBOutlet weak var headerImageView: UIImageView!
    @IBOutlet weak var authorNameLabel: UILabel!
    @IBOutlet weak var publishDateLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionTextView: UITextView!
    
    // Global Variables Section
    var articleModel : ArticleModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setViewData()
    }
    // Helper Methods
    func setViewData() {
        if let imageUrl = articleModel?.urlToImage{
            self.headerImageView.sd_setImage(with: URL(string: imageUrl), completed: nil)
        }
        self.authorNameLabel.text = articleModel?.author
        self.publishDateLabel.text = articleModel?.publishedAt
        self.titleLabel.text = articleModel?.title
        self.descriptionTextView.text = articleModel?.content
    }
    // Actions
    @IBAction func opeArticleUrlAction(_ sender: Any) {
        let safariViewController : SFSafariViewController = SFSafariViewController(url: URL(string: articleModel!.url!)!)
        safariViewController.delegate = self
        self.present(safariViewController, animated: true, completion: nil)
    }
}

extension NewsDetailsViewController : SFSafariViewControllerDelegate{
    func safariViewControllerDidFinish(_ controller: SFSafariViewController) {
        controller.dismiss(animated: true, completion: nil)
    }
}
