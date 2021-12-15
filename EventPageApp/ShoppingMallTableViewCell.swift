//
//  ShoppingMallTableViewCell.swift
//  EventPageApp
//
//  Created by hong on 2021/12/16.
//

import UIKit

class ShoppingMallTableViewCell: UITableViewCell {
    
    private let mallImage: UIImageView = {
        let image = UIImageView()
        image.layer.cornerRadius = image.frame.size.width/2.0
        image.clipsToBounds = true
        return image
    }()
    
    
    private let mallName: UILabel = {
        let text = UILabel()
        text.textAlignment = .center
        text.textColor = .systemTeal
        return text
    }()
    
 


}
