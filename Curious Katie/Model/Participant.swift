//
//  Participants.swift
//  Curious Katie
//
//  Created by Carl Wainwright on 07/06/2018.
//  Copyright © 2018 Carl Wainwright. All rights reserved.
//

import Foundation 

//Using Hashable to allow the Set - ensuring unique hashable values
class Person : Hashable{
    static func == (lhs: Person, rhs: Person) -> Bool {
        return lhs.name == rhs.name
    }
    
    func hash (into hasher: inout Hasher) {
        hasher.combine(name)
    }
    
    //Defines Gender for use in the code
    enum Gender: String{
        case male = "Male"
        case female = "Female"
    }
    
    var age: Int
    var name: String
    //uses enum defined above
    var gender: Gender
    var city: String?
    //sets interest to use Interest structur
    var interests = [Interest]()
    //Initial value of bool is false
    var finishedAddingInterests: Bool = false
    
    init (name:String, age:Int, gender:Gender, city:String?) {
        self.age = age
        self.name = name
        self.gender = gender
        self.city = city
    }
    
    //sets array for cities with optional value
    private static let cities: [String?] = ["Dublin", "Portsmouth", "Clare", "Galway", "Ash Vale", nil]
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
        //loops the below whilst the ammount of participants is less than nember defined in viewController
        while participants.count < amount {
    
            //random number from count of people
            let index: Int = Int(arc4random_uniform(UInt32(people.count)))
            // create array of names from key in people dictionary above
            let name = Array(people.keys)[index]
            
            //checks no duplicate names are used
            if participants.contains(where: {($0.name == name)}) {
            }
            else {
            //add details to Person Set and append to particpants array
            participants.insert(Person(name: name,
                                       age: 18 + Int(arc4random_uniform(UInt32(70 - 18))),
                                       gender: people[name]!,
                                       city: cities[Int(arc4random_uniform(UInt32(cities.count)))]))
            }
        }
        return Array(participants)
    }
}
