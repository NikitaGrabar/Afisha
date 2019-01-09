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
    
    var newsArrayFilms = [FilmsImages](){
        didSet {
            self.FilmsTAbleView.reloadData()
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        getFilmsImag()
    }
    
    // MARK: - Configure methods
    func getFilmsImag() {
        NetManagerFilms.getFilmsImages { (images: [FilmsImages]) in
            self.newsArrayFilms = images
        }
        
        
    }
    
}

extension FilmsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newsArrayFilms.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let filmsCell = tableView.dequeueReusableCell(withIdentifier: "FilmsTableViewCell", for: indexPath) as! FilmsTableViewCell
        let arrayItemFilm = newsArrayFilms[indexPath.row]
//        filmsCell.confugureCellLAbel(model: )
        filmsCell.confugureCellImage(model: arrayItemFilm)
        
        
        
        
        return filmsCell
    }
    
    
}

