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
    
    
    func confugureCellImage(model: FilmsImages) {
        configureImage(image: model.image)
    }
    func confugureCellLAbel(model:FilmsResults ) {
        configureImage(image: model.title)
    }
    
    func configureImage(image: String) {
        
        getImageFromServer(imgageUrl: image)
    }
    
    func configureImageArray(image: UIImage) {
        self.FilmsImages.image = image
        
    }
    
    // MARK: - NetManager Methods save
    func getImageFromServer(imgageUrl: String) {
        let imageURL: URL = URL(string: imgageUrl)!
        let queue = DispatchQueue.global(qos: .utility)
        queue.async{
            if let data = try? Data(contentsOf: imageURL){
                DispatchQueue.main.async {
                    if let image = UIImage(data: data) {
                        self.configureImageArray(image: image)
                    }
                }
            }
        }
    }
    
    
    
}


