//
//  Conversation.swift
//  Curious Katie
//
//  Created by Carl Wainwright on 11/06/2018.
//  Copyright © 2018 Carl Wainwright. All rights reserved.
//

import Foundation


class Conversation {
   
    
    let player = ["John \(Participant.Gender.male)", "James \(Participant.Gender.male)", "Jill \(Participant.Gender.female)", "Mellisa \(Participant.Gender.female)", "Katherin \(Participant.Gender.female)", "Luke \(Participant.Gender.male)", "Robert \(Participant.Gender.male)", "Leona \(Participant.Gender.female)", "Simon \(Participant.Gender.male)", "Conor \(Participant.Gender.male)", "Saorlaith \(Participant.Gender.female)", "Niahm \(Participant.Gender.female)"]
    

    var John = Participant.init(age: 21, name: "John", gender: Participant.Gender.male, myInterest: Interest.generalHobbies)
    var James = Participant.init(age: 32, name: "James", gender: Participant.Gender.male, myInterest: Interest.generalHobbies)
    
}
