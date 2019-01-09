//
//  NewsTableViewCell.swift
//  PlayVideo
//
//  Created by NikitaGrabar on 1/4/19.
//  Copyright © 2019 DenisBaturitskiy. All rights reserved.
//

import UIKit
import AlamofireImage

class NewsTableViewCell: UITableViewCell {

    @IBOutlet weak var imagesNews: UIImageView!
    @IBOutlet weak var labelNews: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    // MARK: - Configure methods
    func confugureCell(model: ResultDictionary) {
        labelNews.text = model.title
        setupImageView(url: model.images[0].image)
    }
    
    func setupImageView(url: String) {
        let urlImage = URL(string: url)!
        imagesNews.af_setImage(withURL: urlImage,
                               placeholderImage: UIImage(),
                               filter: nil, progress: nil,
                               imageTransition: UIImageView.ImageTransition.noTransition, runImageTransitionIfCached: false,
                               completion: nil)
    }
    
}
