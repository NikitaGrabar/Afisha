//
//  FilmsViewController.swift
//  PlayVideo
//
//  Created by NikitaGrabar on 1/5/19.
//  Copyright © 2019 DenisBaturitskiy. All rights reserved.
//

import UIKit

class FilmsViewController: UIViewController {
    @IBOutlet weak var FilmsTAbleView: UITableView!
    
    //Mark:Property
    
    var newsArrayFilms = [FilmsResults](){
        didSet {
            self.FilmsTAbleView.reloadData()
        }
    }
    
    //    var newsFilmsImag = [FilmsImages](){
    //        didSet {
    //            self.FilmsTAbleView.reloadData()
    //
    //        }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getFilmsImag()
    }
    
    //     MARK: - Configure methods
    func getFilmsImag() {
        NetManagerFilms.getFilmsImages { (point:FilmsCount) in
            
            if let filmResult = point.results {
               self.newsArrayFilms = filmResult
            //            if let items = solution.items {
            //                self.moreImage = items
            //            }
            
        }
        
        
    }
    
}
}

extension FilmsViewController: UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newsArrayFilms.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let filmsCell = tableView.dequeueReusableCell(withIdentifier: "FilmsTableViewCell", for: indexPath) as! FilmsTableViewCell
        filmsCell.LabelFilms.text = newsArrayFilms[indexPath.row].title
        filmsCell.confugureCellFilmslabel(modelOne: newsArrayFilms[indexPath.row])
        
        return filmsCell
        
    }
}
extension FilmsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 450//UITableView.automaticDimension
    }
    
    
}
