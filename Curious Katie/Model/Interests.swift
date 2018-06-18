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
    var description: String
    var requiredEquipment: String
    
    init(description: String, requiredEquipment: String) {
        interest = []
        self.description = description
        self.requiredEquipment = requiredEquipment
    }
    
    class Football: Interests {
        
    }
    
//    func shareInterest() {
//        print ("I have an interest in \(interest), which involves \(description)/n")
//        if requiredEquipment.isEmpty {
//        }
//        else {
//            print (requiredEquipment)
//        }
//    }

}
