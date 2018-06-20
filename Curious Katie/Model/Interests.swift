//
//  Interests.swift
//  Curious Katie
//
//  Created by Carl Wainwright on 07/06/2018.
//  Copyright © 2018 Carl Wainwright. All rights reserved.
//

import Foundation

class Interests {
    
    
        static let generalHobbies = Interests.generateGeneralHobbies()
    
    var name: String
        //["Football", "Rugby", "Snooker", "Swimming", "Paintballing", "Hiking", "Running", "Horse Riding", "Skiing", "Absailing"]
    var description: String
    var requiredEquipment: String
    

    
    static func generateGeneralHobbies() -> [Interests] {
        let hobbies = [Interests]()
        
        _ = Interests(name: "football", description: "Football is a family of team sports that involve, to varying degrees, kicking a ball with a foot to score a goal.", requiredEquipment: "Football")
        _ = Interests(name: "rugby", description: "Rugby is a game played with an oval ball by two teams of 15 players (in rugby union play) or 13 players (in rugby league play).", requiredEquipment: "Rugby ball")
        _ = Interests(name: "snooker", description: "It is played using a cue and snooker balls: one white cue ball , 15 red balls worth one point each (sometimes played with fewer red balls, commonly 6 or 10), and six balls of different colours : yellow (2 points), green (3), brown (4), blue (5), pink (6), black (7).", requiredEquipment: "Snooker table, cue and snooker balls")
        _ = Interests(name: "swimming", description: "Swimming is an individual or team sport that requires the use of ones arms and legs to move the body through water.", requiredEquipment: "swimming costume")
        _ = Interests(name: "paintballing", description: "Paintball is a competitive team shooting sport in which players eliminate opponents from play by hitting them with spherical dye-filled gelatin capsules that break upon impact.", requiredEquipment: "Paintball Marker, paintballs")
        return hobbies
    }
    
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


