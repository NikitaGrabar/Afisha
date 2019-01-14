//
//  NetManagerEverImages.swift
//  PlayVideo
//
//  Created by NikitaGrabar on 1/14/19.
//  Copyright © 2019 DenisBaturitskiy. All rights reserved.
//

import Foundation
import Alamofire

let urlImages = "https://kudago.com/public-api/v1.2/lists/4058/?expand=images"
let urlImagess = "https://kudago.com/public-api/v1.2/lists/"

struct ResultImages: Decodable {
    var id: Int
    var title: String
    var items: [Items]?
}

struct Items: Decodable{
    var id: Int
    var title: String
    var description: String
    var first_image: Image?
    
}


struct Image: Decodable{
    var image: String?
}


final class NetManagerMoreImage: NSObject {
    
    static func getMore(id: String, complition: @escaping(ResultImages) -> Void) {
        // let params = ["fields":"publication_date,title,images,id","location":location]
        let newUrl = urlImagess + id + "/?expand=images"
        Alamofire.request(newUrl,
                          method: HTTPMethod.get,
                          parameters: nil).responseJSON {
                            response in
                            
                            switch response.result {
                            case .success:
                                guard let data = response.data else { return }
                                do {
                                    let object = try JSONDecoder().decode(ResultImages.self, from: data)
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
