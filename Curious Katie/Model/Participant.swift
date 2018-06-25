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
    var myInterest = [Interest]()
    
    init (age:Int, name:String, gender:Gender, myInterest: [Interest]) {
        self.age = age
        self.name = name
        self.gender = gender
        self.myInterest = myInterest
    }
    
    
    
    
}

