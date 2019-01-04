//
//  NewsTableViewCell.swift
//  PlayVideo
//
//  Created by NikitaGrabar on 1/4/19.
//  Copyright © 2019 DenisBaturitskiy. All rights reserved.
//

import UIKit

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
        configureImage(image: model.images[0].image)
    }
    
    func configureImage(image: String) {

    getImageFromServer(imgageUrl: image)
    }
    
    func configureImageArray(image: UIImage) {
        self.imagesNews.image = image
        
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
