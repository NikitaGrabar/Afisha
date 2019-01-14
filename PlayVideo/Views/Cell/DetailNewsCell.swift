//
//  DetailNewsCell.swift
//  PlayVideo
//
//  Created by NikitaGrabar on 1/14/19.
//  Copyright © 2019 DenisBaturitskiy. All rights reserved.
//

import UIKit

class DetailNewsCell: UITableViewCell {

    // MARK: - IBOutlets
    @IBOutlet weak var detailImageView: UIImageView!
    @IBOutlet weak var detailDescriptionLabel: UILabel!
    @IBOutlet weak var detailNewsTextLabel: UILabel!

    
    // MARK: - Configure cell
    func configureCell(withModel: DetailNews) {
        detailDescriptionLabel.text = withModel.description.html2String
        detailNewsTextLabel.text = withModel.body_text.html2String
    }
    
    func configureImage(image: UIImage) {
        detailImageView.image = image
    }

    
}

extension Data {
    var html2AttributedString: NSAttributedString? {
        do {
            return try NSAttributedString(data: self, options: [.documentType: NSAttributedString.DocumentType.html, .characterEncoding: String.Encoding.utf8.rawValue], documentAttributes: nil)
        } catch {
            print("error:", error)
            return  nil
        }
    }
    var html2String: String {
        return html2AttributedString?.string ?? ""
    }
}

extension String {
    var html2AttributedString: NSAttributedString? {
        return Data(utf8).html2AttributedString
    }
    var html2String: String {
        return html2AttributedString?.string ?? ""
    }
}
