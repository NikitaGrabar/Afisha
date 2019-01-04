//
//  CollectionViewCell.swift
//  PlayVideo
//
//  Created by Admin on 28.12.2018.
//  Copyright © 2018 DenisBaturitskiy. All rights reserved.
//

import UIKit

class StartCell: UICollectionViewCell {
    
    // MARK: - IBOutlets
    @IBOutlet weak var PresentText: UILabel!
    
    
    // MARK: - Configure cell
    func configureCell(withText: String) {
        PresentText.text = withText
    }
}
