//
//  EventManager.swift
//  EventPageApp
//
//  Created by hong on 2021/12/16.
//

import Foundation
import Alamofire
import SwiftyJSON



struct EventManger {
    
    
    
    func getEventData(shoppingMal: String) {
        
        let url = "https://gg6hx0.deta.dev/"
        
        AF.request(url,method: .get).validate().responseJSON { (response) in
            switch response.result {
            case .success(let value):
                let eventJSON: JSON = JSON(value)
                updateEventData(json: eventJSON)
                print(eventJSON)
            case let .failure(error):
                print(error)
            }
        }
    }
    
    func updateEventData(json:JSON) {
        
        for ShoppingMall in ShoppingMallList {
            
            guard let imageURL = json[ShoppingMall].array else {return}
            
            let imgURL = imageURL.map{$0.stringValue}
            
            guard let detailURL = json[ShoppingMall].array else {return}
            
            let dtURL = detailURL.map{$0.stringValue}
            
            let item = EventModel(ShopMallName: ShoppingMall, imageURL: imgURL, detailURL: dtURL)
            
            eventData.append(item)
        
        }
        print(eventData)
    }
    
    
}
