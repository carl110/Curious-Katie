//
//  Interests.swift
//  Curious Katie
//
//  Created by Carl Wainwright on 07/06/2018.
//  Copyright © 2018 Carl Wainwright. All rights reserved.
//

import Foundation

class Interest {
    
//    public static let name = ["Football", "Rugby", "Snooker", "Swimming", "Paintballing", "Hiking", "Running", "Horse Riding", "Skiing", "Abseiling"]

    var name: String
        //["Football", "Rugby", "Snooker", "Swimming", "Paintballing", "Hiking", "Running", "Horse Riding", "Skiing", "Abseiling"]
    var description: String
    var requiredEquipment: String
    
    static func generateGeneralHobbies() -> [Interest] {
        var hobby = [Interest]()
        
        let football = Interest(name: "football", description: "a family of team sports that involve, to varying degrees, kicking a ball with a foot to score a goal", requiredEquipment: "a Football")
        let rugby = Interest(name: "rugby", description: "a game played with an oval ball by two teams of 15 players (in rugby union play) or 13 players (in rugby league play)", requiredEquipment: "a Rugby ball")
        let snooker = Interest(name: "snooker", description: "played using a cue and snooker balls: one white cue ball , 15 red balls worth one point each (sometimes played with fewer red balls, commonly 6 or 10), and six balls of different colours : yellow (2 points), green (3), brown (4), blue (5), pink (6), black (7)", requiredEquipment: "a Snooker table, cue and snooker balls")
        let swimming = Interest(name: "swimming", description: "an individual or team sport that requires the use of ones arms and legs to move the body through water", requiredEquipment: "a swimming costume")
        let paintballing = Interest(name: "paintballing", description: "a competitive team shooting sport in which players eliminate opponents from play by hitting them with spherical dye-filled gelatin capsules that break upon impact", requiredEquipment: "a Paintball Marker, paintballs")
        let hiking = Interest(name: "hiking", description: "a long, vigorous walk, usually on trails (footpaths), in the countryside", requiredEquipment: "a Comfortable shoes")
        let running = Interest(name: "running", description: "a method of terrestrial locomotion allowing rapid movement on foot", requiredEquipment: "a pair of running shoes")
        let horseriding = Interest(name: "horse riding", description: "the skill of riding, driving, steeplechasing or vaulting with horses", requiredEquipment: "a Horse with a saddle")
        let skiing = Interest(name: "skiing", description: "a means of transport, a recreational activity or a competitive winter sport in which the participant uses skis to glide on snow", requiredEquipment: "Skis and ski sticks")
        let abseiling = Interest(name: "abseiling", description: "to descend a rock face or other near-vertical surface by using a doubled rope coiled round the body and fixed at a higher point", requiredEquipment: "a Rope, harnes, helmet and carabiners")
        
        hobby.append(contentsOf: [football, rugby, snooker, swimming, paintballing, hiking, running, horseriding, skiing, abseiling])
        
        
        return hobby
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


