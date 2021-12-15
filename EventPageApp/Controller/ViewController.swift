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

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        eventManger.getEventData(url: url)
    }


}

