//
//  NetManagerFilms.swift
//  PlayVideo
//
//  Created by NikitaGrabar on 1/5/19.
//  Copyright © 2019 DenisBaturitskiy. All rights reserved.
//

import Foundation
import Alamofire


let urlFilms = "https://kudago.com/public-api/v1.2/movies/"


struct FilmsCount: Decodable {
    var count:Int
    var next:String
    var previous:String?
    var results:[FilmsResults]?
}

struct FilmsResults: Decodable {
    var id :Int
    var title: String
    var poster: FilmsImages
    
}

struct FilmsImages: Decodable {
    var image:String
}


//
//struct FilmsTiile: Decodable {
//    var year:Int
//    var images: [FilmsImages]
//}
//struct FilmsImages: Decodable {
//   var image:String
//}


final class NetManagerFilms: NSObject {
    
    static func getFilmsImages(complition: @escaping(FilmsCount) -> Void) {
        Alamofire.request(urlFilms,
                   method: HTTPMethod.get,
                   parameters: nil).responseJSON {
                    response in
                    
                    switch response.result {
                    case .success:
                        guard let data = response.data else { return }
                        do {
                            let object = try JSONDecoder().decode(FilmsCount.self, from: data)
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
