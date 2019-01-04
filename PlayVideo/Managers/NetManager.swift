//
//  File.swift
//  PlayVideo
//
//  Created by Admin on 28.12.2018.
//  Copyright © 2018 DenisBaturitskiy. All rights reserved.
//


import Alamofire
import Foundation

let url = "https://kudago.com/public-api/v1.4/locations/?lang=&fields=&order_by="

struct Cities: Decodable {
    var cities: [NameCity]
}

struct NameCity: Decodable {
    var slug: String
    var name : String
}


final class NetManager: NSObject {
    
    static func getNews(complition: @escaping([NameCity]) -> Void) {
        AF.request(url,
                   method: HTTPMethod.get,
                   parameters: nil).responseJSON {
                    response in
                    
                    switch response.result {
                    case .success:
                        guard let data = response.data else { return }
                        do {
                            let object = try JSONDecoder().decode([NameCity].self, from: data)
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
