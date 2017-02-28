//
//  BaseCollectionViewCell.swift
//  SMS
//
//  Created by SSd on 2/22/17.
//  Copyright © 2017 SSd. All rights reserved.
//

import UIKit

class  BaseCollectionViewCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    
    func setupView() {
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
