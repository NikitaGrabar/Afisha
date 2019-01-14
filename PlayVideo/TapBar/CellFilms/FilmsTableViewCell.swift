//
//  FilmsTableViewCell.swift
//  PlayVideo
//
//  Created by NikitaGrabar on 1/5/19.
//  Copyright © 2019 DenisBaturitskiy. All rights reserved.
//

import UIKit

class FilmsTableViewCell: UITableViewCell {
    @IBOutlet weak var FilmsImages: UIImageView!
    @IBOutlet weak var LabelFilms: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    
    func confugureCellFilmslabel(modelOne: FilmsResults) {
        LabelFilms.text = modelOne.title
        if  (modelOne.poster.image) != nil {
            setupImageView(url: (modelOne.poster.image))
        }
        
        //        if (model.first_image?.image) != nil {
        //            setupImageView(url: (model.first_image?.image)!)
        //        }
    }
    
    // MARK: - NetManager Methods save
    func setupImageView(url: String) {
        let urlImage = URL(string: url)!
        FilmsImages.af_setImage(withURL: urlImage,
                                placeholderImage: UIImage(),
                                filter: nil, progress: nil,
                                imageTransition: UIImageView.ImageTransition.noTransition, runImageTransitionIfCached: false,
                                completion: nil)
    }
    
}
