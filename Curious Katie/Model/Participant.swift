//
//  Participants.swift
//  Curious Katie
//
//  Created by Carl Wainwright on 07/06/2018.
//  Copyright © 2018 Carl Wainwright. All rights reserved.
//

import Foundation 

class Participant {

    
    //Defines Gender for use in the code
    enum Gender: String{
        case male = "Male"
        case female = "Female"
    }
    
    var age: Int
    var name: String
    var gender: Gender
    
    init (name:String, age:Int, gender:Gender) {
        self.age = age
        self.name = name
        self.gender = gender
    }
    
    
    
    
}

let person = [Participant(name: "John", age: 32, gender: Participant.Gender.male),
              Participant(name: "James", age: 43, gender: Participant.Gender.male),
              Participant(name: "Jill", age: 36, gender: Participant.Gender.female),
              Participant(name: "Mellisa", age: 21, gender: Participant.Gender.female),
              Participant(name: "Katherine", age: 38, gender: Participant.Gender.female),
              Participant(name: "Luke", age: 33, gender: Participant.Gender.male),
              Participant(name: "Robert", age: 28, gender: Participant.Gender.male),
              Participant(name: "Leona", age: 19, gender: Participant.Gender.female),
              Participant(name: "Simon", age: 39, gender: Participant.Gender.male),
              Participant(name: "Conor", age: 20, gender: Participant.Gender.male),
              Participant(name: "Saorlaith", age: 45, gender: Participant.Gender.female),
              Participant(name: "Jane", age: 25, gender: Participant.Gender.female),
              Participant(name: "Niahm", age: 21, gender: Participant.Gender.female)]



