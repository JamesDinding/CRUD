//
//  data.swift
//  CRUD_Ding
//
//  Created by User02 on 2020/6/23.
//  Copyright © 2020 sun. All rights reserved.
//

import Foundation


struct Event: Identifiable, Codable {
    var id = UUID()
    var type: String
    var money: Int
    var notice: String
}

class EventsData: ObservableObject {
    @Published var events = [Event](){
        didSet{
            let encoder = JSONEncoder()
            if let data = try? encoder.encode(events){
                UserDefaults.standard.set(data, forKey: "myEvents")
            }
        }
    }
    init() {
        if let data = UserDefaults.standard.data(forKey: "myEvents"){
            let decoder = JSONDecoder()
            if let decodeData = try? decoder.decode([Event].self, from: data){
                events = decodeData
            }
        }
    }
    
}
