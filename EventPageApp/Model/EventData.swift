//
//  EventData.swift
//  EventPageApp
//
//  Created by hong on 2021/12/16.
//

import Foundation

struct EventData: Codable {
    let name : String
    let imageURL : [ImageURL]
    let detailURL : [DetailURL]
}

struct ImageURL: Codable {
    let url: String
}

struct DetailURL: Codable {
    let url: String
}
