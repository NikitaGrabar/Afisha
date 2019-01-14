//
//  EverTableViewCell.swift
//  PlayVideo
//
//  Created by NikitaGrabar on 1/14/19.
//  Copyright © 2019 DenisBaturitskiy. All rights reserved.
//

import UIKit
import AlamofireImage

class EverTableViewCell: UITableViewCell {
    @IBOutlet weak var ImageMoreEver: UIImageView!
    @IBOutlet weak var LabelMoreEver: UILabel!
    

    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    // MARK: - Configure methods
    func confugureCellEver(model: Items ) {
        LabelMoreEver.text = model.title
        if (model.first_image?.image) != nil {
            setupImageView(url: (model.first_image?.image)!)
        }
        
    }
    
    func setupImageView(url: String) {
        let urlImage = URL(string: url)!
        ImageMoreEver.af_setImage(withURL: urlImage,
                              placeholderImage: UIImage(),
                              filter: nil, progress: nil,
                              imageTransition: UIImageView.ImageTransition.noTransition, runImageTransitionIfCached: false,
                              completion: nil)
    }
    
}

