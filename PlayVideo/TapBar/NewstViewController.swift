//
//  FavoritViewController.swift
//  PlayVideo
//
//  Created by User on 1/3/19.
//  Copyright © 2019 DenisBaturitskiy. All rights reserved.
//

import UIKit

class NewstViewController: UIViewController {

    @IBOutlet weak var newsTableView: UITableView!
    
    //Mark:Property
    
    var newsArrayNews = [ResultDictionary](){
        didSet {
            self.newsTableView.reloadData()
        }
    }
    
    var nextPageUrl: String?
    var isLoad: Bool = false

    override func viewDidLoad() {
        super.viewDidLoad()
        getNewsImag()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        navigationController?.navigationBar.isHidden = true
    }
    
    // MARK: - Configure methods
    func getNewsImag() {
        NetManagerNews.getNewsImages(url: urlNews, location: globalLocation) { (result: NewsDictionary) in
            self.newsArrayNews = result.results
            self.nextPageUrl = result.next
        }
    }
    
    
    func getNewsPagination(paginationUrl: String) {
        isLoad = true
        NetManagerNews.getNewsImages(url: paginationUrl, location: globalLocation) { (result: NewsDictionary) in
            self.newsArrayNews += result.results
            if let nextPage = result.next {
                self.nextPageUrl = nextPage
            } else {
                self.nextPageUrl = nil
            }
            self.isLoad = false
        }
    }
    
    
    
}

extension NewstViewController: UITableViewDataSource {
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

extension NewstViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       print(newsArrayNews[indexPath.row].id)
        
        let cell = tableView.cellForRow(at: indexPath) as! NewsTableViewCell
        
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: "NavigationTableViewController") as! NavigationTableViewController
        vc.newsId = newsArrayNews[indexPath.row].id
        vc.image = cell.imagesNews.image
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {

        let indexCellforDownoload = newsArrayNews.count - 2
       
            if indexPath.row > indexCellforDownoload {
                if isLoad == false {
                    if let next = nextPageUrl { getNewsPagination(paginationUrl: next) }
                    
                } else {
                }
            }
        
    }
    
    
    
}
