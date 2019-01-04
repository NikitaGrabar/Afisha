//
//  FavoritViewController.swift
//  PlayVideo
//
//  Created by User on 1/3/19.
//  Copyright © 2019 DenisBaturitskiy. All rights reserved.
//

import UIKit

class FavoritViewController: UIViewController {

    @IBOutlet weak var newsTableView: UITableView!
    
    //Mark:Property
    
    var newsArrayNews = [ResultDictionary](){
        didSet {
            self.newsTableView.reloadData()
        }
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getNewsImag()
  }
    
    // MARK: - Configure methods
    func getNewsImag() {
        NetManagerNews.getNewsImages { (result: [ResultDictionary]) in
            self.newsArrayNews = result
        }
    
    
}
    
}

    extension FavoritViewController: UITableViewDataSource {
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return newsArrayNews.count
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let newsCell = tableView.dequeueReusableCell(withIdentifier: "NewsTableViewCell", for: indexPath) as! NewsTableViewCell
            let arrayItem = newsArrayNews[indexPath.row]
             newsCell.confugureCell(model: arrayItem)
             
            
            
            
            return newsCell
        }
        
        
}
