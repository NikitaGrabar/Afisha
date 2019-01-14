//
//  EverImagesViewController.swift
//  PlayVideo
//
//  Created by NikitaGrabar on 1/14/19.
//  Copyright © 2019 DenisBaturitskiy. All rights reserved.
//

import UIKit
import AlamofireImage

class ImageViewController: UIViewController {
    
    @IBOutlet weak var EvertableViewImage: UITableView!
    var moreId: Int?
    var moreImage = [Items]() {
        didSet {
            self.EvertableViewImage.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getMoreImage()
        EvertableViewImage.dataSource = self
        EvertableViewImage.delegate = self
        
        
    }
    func getMoreImage() {
        if let id = moreId {
            let idStr = String(id)
            NetManagerMoreImage.getMore(id: idStr) { (solution: ResultImages) in
                if let items = solution.items {
                    self.moreImage = items
                }
            }
        }
    }
    
}
extension ImageViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return moreImage.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellNew = tableView.dequeueReusableCell(withIdentifier: "EverTableViewCell", for: indexPath) as!
        EverTableViewCell
        cellNew.LabelMoreEver.text = moreImage[indexPath.row].title
        cellNew.confugureCellEver(model: moreImage[indexPath.row])
        
        
        return cellNew
        
    }
    
}

extension ImageViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
    }
    
}


