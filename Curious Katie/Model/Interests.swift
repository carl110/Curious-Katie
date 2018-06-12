//
//  Interests.swift
//  Curious Katie
//
//  Created by Carl Wainwright on 07/06/2018.
//  Copyright © 2018 Carl Wainwright. All rights reserved.
//

import Foundation

class Interests {
    var interest = ["Football", "Rugby", "Snooker", "Swimming", "Paintballing", "Hiking", "Running", "Horse Riding", "Skiing", "Absailing"]
    var title: String
    var description: String
    var requiredEquipment: String
    
    init(title: String, description: String, requiredEquipment: String) {
        interest = []
        self.title = title
        self.description = description
        self.requiredEquipment = requiredEquipment
    }
}
