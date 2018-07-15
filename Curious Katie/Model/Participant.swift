//
//  Participants.swift
//  Curious Katie
//
//  Created by Carl Wainwright on 07/06/2018.
//  Copyright © 2018 Carl Wainwright. All rights reserved.
//

import Foundation 

//Using Hashable to allow the Set - ensuring unique hashable values
struct Person : Hashable{
    var hashValue: Int {
        return self.name.hashValue ^ self.age.hashValue
    }
    

    
    
    
        private static let cities: [String?] = ["Dublin", "Portsmouth", "Clare", "Galway", "Ash Vale", nil]
    
    //Defines Gender for use in the code
    enum Gender: String{
        case male = "Male"
        case female = "Female"
    }
    
    var age: Int
    var name: String
    var gender: Gender
    var city: String?
    
    
    init (name:String, age:Int, gender:Gender, city:String?) {
        self.age = age
        self.name = name
        self.gender = gender
        self.city = city
        
        
        
    }
    // Dictionary with names as key and gender as value
    private static let people: [String:Gender] = ["John":Gender.male,
                                                  "Jill":Gender.female,
                                                  "Mellisa":Gender.female,
                                                  "Katherine":Gender.female,
                                                  "Luke":Gender.male,
                                                  "Robert":Gender.male,
                                                  "Leona":Gender.female,
                                                  "Simon":Gender.male,
                                                  "Conor":Gender.male,
                                                  "Saorlaith":Gender.female,
                                                  "Jane":Gender.female,
                                                  "Niahm":Gender.female]
    

    
    static func generateParticipants(amount: Int) -> [Person] {
    
        //Set creates an unordered list of participants
        var participants = Set<Person>()
    
        while participants.count < amount {
    
            //random number from count of people
            let index: Int = Int(arc4random_uniform(UInt32(people.count)))
            // create array of names from key in people dictionary above
            let name = Array(people.keys)[index]
            
    
            //add details to Person Set and append to particpants array
            participants.insert(Person(name: name,
                                       age: 18 + Int(arc4random_uniform(UInt32(70 - 18))),
                                       gender: people[name]!,
                                       city: cities[Int(arc4random_uniform(UInt32(cities.count)))]))
        }
    
        return Array(participants)
        
        

    }



}

