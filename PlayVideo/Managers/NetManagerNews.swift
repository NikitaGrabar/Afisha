//
//  NetManagerNews.swift
//  PlayVideo
//
//  Created by User on 1/3/19.
//  Copyright © 2019 DenisBaturitskiy. All rights reserved.
//
import Alamofire
import Foundation



let urlNews = "https://kudago.com/public-api/v1.2/news/?fields=publication_date,title,images,id"



struct NewsDictionary:Decodable {
    var count: Int
    var next: String
    var results: [ResultDictionary]
    
}

struct ResultDictionary:Decodable {
    var id : Int
    var title: String
    var images : [ImagArray]
}

struct ImagArray:Decodable {
   var image: String
   var source: SourceDictionary
}

struct SourceDictionary:Decodable {
    var name: String
    var link: String
}


final class NetManagerNews: NSObject {
    
    static func getNewsImages(complition: @escaping([ResultDictionary]) -> Void) {
        AF.request(url,
                   method: HTTPMethod.get,
                   parameters: nil).responseJSON {
                    response in
                    
                    switch response.result {
                    case .success:
                        guard let data = response.data else { return }
                        do {
                            let object = try JSONDecoder().decode([ResultDictionary].self, from: data)
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

