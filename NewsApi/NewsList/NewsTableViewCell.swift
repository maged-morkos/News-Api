//
//  NewsTableViewCell.swift
//  NewsApi
//
//  Created by Maged Morkos on 6/20/19.
//  Copyright © 2019 Maged Morkos. All rights reserved.
//

import UIKit
import SDWebImage
class NewsTableViewCell: UITableViewCell {
    @IBOutlet weak var headerImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var publishedDateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setCellData(articleModel : ArticleModel) {
        self.titleLabel.text = articleModel.title
        self.publishedDateLabel.text = articleModel.publishedAt
        if let imageUrl = articleModel.urlToImage{
            self.headerImageView.sd_setImage(with: URL(string: imageUrl), completed: nil)
        }
        
    }

}
