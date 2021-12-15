//
//  ViewController.swift
//  EventPageApp
//
//  Created by hong on 2021/12/16.
//

import UIKit

class ViewController: UIViewController {
    
    let url = "https://gg6hx0.deta.dev/"
    
    let eventManger = EventManger()
    
    let imageView = UIImageView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(imageView)
        imageView.frame = CGRect(x: 50, y: 50, width: 300, height: 300)
        
        
        // Do any additional setup after loading the view.
        eventManger.getEventData(shoppingMal: "알라딘")
    }


}

