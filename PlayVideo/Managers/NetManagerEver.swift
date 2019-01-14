//
//  NetManagerEver.swift
//  PlayVideo
//
//  Created by NikitaGrabar on 1/14/19.
//  Copyright © 2019 DenisBaturitskiy. All rights reserved.
//
import Foundation
import Alamofire


let urlMore = "https://kudago.com/public-api/v1.4/lists/"



struct MoreDictionary:Decodable {
    var count: Int
    var next: String
    var previous: String?
    var results: [Results]
}

struct Results: Decodable {
    var id : Int
    var title : String
    //var images: [Images]
}



final class NetManagerMore: NSObject {
    
    static func getMore(complition: @escaping(MoreDictionary) -> Void) {

        Alamofire.request(urlMore,
                          method: HTTPMethod.get,
                          parameters: nil).responseJSON {
                            response in
                            
                            switch response.result {
                            case .success:
                                guard let data = response.data else { return }
                                do {
                                    let object = try JSONDecoder().decode(MoreDictionary.self, from: data)
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
