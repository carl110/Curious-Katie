//
//  Interests.swift
//  Curious Katie
//
//  Created by Carl Wainwright on 07/06/2018.
//  Copyright © 2018 Carl Wainwright. All rights reserved.
//

import Foundation

class Interests {
    var name: String
        //["Football", "Rugby", "Snooker", "Swimming", "Paintballing", "Hiking", "Running", "Horse Riding", "Skiing", "Absailing"]
    var description: String
    var requiredEquipment: String
    
    init(name: String, description: String, requiredEquipment: String) {
        self.name = name
        self.description = description
        self.requiredEquipment = requiredEquipment

    
    }
}
    
   
    
//    func shareInterest() {
//        print ("I have an name in \(interest), which involves \(description)/n")
//        if requiredEquipment.isEmpty {
//        }
//        else {
//            print (requiredEquipment)
//        }
//    }


