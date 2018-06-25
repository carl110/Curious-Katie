//
//  Participants.swift
//  Curious Katie
//
//  Created by Carl Wainwright on 07/06/2018.
//  Copyright © 2018 Carl Wainwright. All rights reserved.
//

import Foundation 

class Participant {

    static let arrayOfNames = Participant.generateArrayOfNames()
    
    //Defines Gender for use in the code
    enum Gender: String{
        case male = "Male"
        case female = "Female"
    }
    
    var age: Int
    var name: String
    var gender: Gender
    
    static func generateArrayOfNames() -> [Participant] {
        var person = [Participant]()
        
        let John = Participant(name: "John", age: 32, gender: Participant.Gender.male)
        let Jill = Participant(name: "Jill", age: 36, gender: Participant.Gender.female)
        let Mellisa = Participant(name: "Mellisa", age: 21, gender: Participant.Gender.female)
        let Katherine = Participant(name: "Katherine", age: 38, gender: Participant.Gender.female)
        let Luke = Participant(name: "Luke", age: 33, gender: Participant.Gender.male)
        let Robert = Participant(name: "Robert", age: 28, gender: Participant.Gender.male)
        let Leona = Participant(name: "Leona", age: 19, gender: Participant.Gender.female)
        let Simon = Participant(name: "Simon", age: 39, gender: Participant.Gender.male)
        let Conor = Participant(name: "Conor", age: 20, gender: Participant.Gender.male)
        let Saorlaith = Participant(name: "Saorlaith", age: 45, gender: Participant.Gender.female)
        let Jane = Participant(name: "Jane", age: 25, gender: Participant.Gender.female)
        let Niahm = Participant(name: "Niahm", age: 21, gender: Participant.Gender.female)
        
        person.append(contentsOf: [John, Jill, Mellisa, Katherine, Luke, Robert, Leona, Simon, Conor, Saorlaith, Jane, Niahm])
        
        return person
    }
    
    init (name:String, age:Int, gender:Gender) {
        self.age = age
        self.name = name
        self.gender = gender
    }
    
    
    
    
}
