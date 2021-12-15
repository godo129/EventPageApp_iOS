//
//  EventManager.swift
//  EventPageApp
//
//  Created by hong on 2021/12/16.
//

import Foundation
import Alamofire
import swifty



struct EventManger {
    
    let url = "https://gg6hx0.deta.dev/"
    
    func getEventData(url: String) {
        AF.request(url,method: .get).validate().responseJSON { (response) in
            switch response.result {
            case .success(let value):
                print(value)
            case let .failure(error):
                print(error)
            }
        }
    }
    
    func parseJSON(
    
    
}
