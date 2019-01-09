//
//  NetManagerFilms.swift
//  PlayVideo
//
//  Created by NikitaGrabar on 1/5/19.
//  Copyright © 2019 DenisBaturitskiy. All rights reserved.
//

import Foundation
import Alamofire






let urlFilms = "https://kudago.com/public-api/v1.4/movies/?fields=site_url,title,genres,original_title,year,images,imdb_url"


struct FilmsCount: Decodable {
    var count:Int
    var next:String
    var previous:String
    var results:[FilmsResults]
}

struct FilmsResults: Decodable {
    var site_url:String
    var title: String
    var genres: [FilmsGenres]
}

struct FilmsGenres: Decodable {
   var id :Int
    var name:String
    var slug: String
}



struct FilmsTiile: Decodable {
    var year:Int
    var images: [FilmsImages]
}
struct FilmsImages: Decodable {
   var image:String
}


final class NetManagerFilms: NSObject {
    
    static func getFilmsImages(complition: @escaping([FilmsImages]) -> Void) {
        Alamofire.request(url,
                   method: HTTPMethod.get,
                   parameters: nil).responseJSON {
                    response in
                    
                    switch response.result {
                    case .success:
                        guard let data = response.data else { return }
                        do {
                            let object = try JSONDecoder().decode([FilmsImages].self, from: data)
                            complition(object)
                        } catch let error {
                            print(error)
                        }
                        break
                    case .failure(let error):
                        print(error)
                    }
        }
    }
    
    
}
