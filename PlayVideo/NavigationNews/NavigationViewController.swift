//
//  NavigationViewController.swift
//  PlayVideo
//
//  Created by NikitaGrabar on 1/13/19.
//  Copyright © 2019 DenisBaturitskiy. All rights reserved.
//

import UIKit

class NavigationTableViewController: UIViewController {

    // MARK: - IBOutlets
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Properties
    var newsId: Int?
    var image: UIImage?
    var newsArray = [DetailNews]() {
        didSet {
            self.tableView.reloadData()
        }
    }
    
    
    // MARK: -
    // MARK: - ViewController lifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        getDataFromServer()
        self.navigationController?.navigationBar.isHidden = false
    }
    
    // MARK: - NetManager methods
    func getDataFromServer() {
        if let id = newsId {
            NetManagerNews.getNewsDetail(id: id) { (result: DetailNews) in
                self.newsArray = [result]
            }
        }
    }
    
}

extension NavigationTableViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DetailNewsCell", for: indexPath) as! DetailNewsCell        
        cell.configureCell(withModel: newsArray[indexPath.row])
        if let img = image {
            cell.configureImage(image: img)
        }
        return cell
    }
}

extension NavigationTableViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}


    
