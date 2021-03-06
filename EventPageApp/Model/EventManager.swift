//
//  EventManager.swift
//  EventPageApp
//
//  Created by hong on 2021/12/16.
//

import Foundation
import Alamofire
import SwiftyJSON

protocol EventManagerDelegate {
    func didUpdateEventData(_ eventManger: EventManger, event: EventModel)
    func didFailUpdateEventData(error: Error)
}



struct EventManger {
    
    var delegate: EventManagerDelegate?
    
    func getEventData(shoppingMall: String) {
        
        let url = "https://gg6hx0.deta.dev/"
        
        AF.request(url,method: .get).validate().responseJSON { (response) in
            switch response.result {
            case .success(let value):
                let eventJSON: JSON = JSON(value)
                if let event = updateEventData(json: eventJSON, ShoppingMall: shoppingMall) {
                    self.delegate?.didUpdateEventData(self,event: event)
                 
                }
            case let .failure(error):
                
                self.delegate?.didFailUpdateEventData(error: error)

            }
        }
    }
    
    
    func updateEventData(json:JSON,ShoppingMall: String) -> EventModel? {
        
        guard let list = json[ShoppingMall].dictionary else {return nil}
        
  
        guard let imageURL = list["image_url"]?.array else {return nil}
        
        let imgURL = imageURL.map{$0.stringValue}
        
        guard let detailURL = list["detail_url"]?.array else {return nil}
        
        let dtURL = detailURL.map{$0.stringValue}
        
        let item = EventModel(ShopMallName: ShoppingMall, imageURL: imgURL, detailURL: dtURL)
    
        return item


    }
    
    
}
