//
//  ViewController.swift
//  EventPageApp
//
//  Created by hong on 2021/12/16.
//

import UIKit
import Kingfisher

class ViewController: UIViewController {
    
    let url = "https://gg6hx0.deta.dev/"
    
    var eventManger = EventManger()
    
    let imageView = UIImageView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(imageView)
        imageView.frame = CGRect(x: 50, y: 50, width: 300, height: 300)
        
        
        // Do any additional setup after loading the view.
        eventManger.getEventData(shoppingMal: "알라딘")
        
        eventManger.delegate = self
    }


}

extension ViewController: EventManagerDelegate {
    func didUpdateEventData(_ eventManger: EventManger, event: EventModel) {
        print("업데이트 완료 ")
        DispatchQueue.main.async {
            self.imageView.kf.setImage(with: URL(string: event.imageURL[0]))
        }
    }
    
}

