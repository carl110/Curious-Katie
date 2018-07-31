//
//  ConversationModelView.swift
//  Curious Katie
//
//  Created by Carl Wainwright on 18/06/2018.
//  Copyright © 2018 Carl Wainwright. All rights reserved.
//

import Foundation


class ViewModel {
    
    //declare as string array
    var currentPersonAvailableInterests: [String] = []
    //declare as string
    var newInterestName = ""
    let hobby = Interest.generateGeneralHobbies()
    
    func getRandomPerson(participants: [Person], onSuccess: (Person) -> Void, onFinish: () -> Void) {
        
        let filtered = participants.filter { $0.finishedAddingInterests == false }
        if filtered.count == 0 {
            onFinish()
        }
        else {
            let randomPerson = filtered[Int(arc4random_uniform(UInt32(filtered.count)))]
            getAvailableInterests(of: randomPerson)
            onSuccess(randomPerson)
        }
    }
    
    func getAvailableInterests(of person: Person) {
        
        let set1: Set<String> = Set(person.interests.map{ $0.name })
        let set2: Set<String> = Set(Interest.generateGeneralHobbies().map({$0.name}))
        
        currentPersonAvailableInterests = Array(set2.subtracting(set1))
    }
    
    func updateParticipant(person: Person, within participants: [Person], with interest: Interest) {
        
//        if let myNewInterest = (hobby.filter{ $0.name == newInterestName }).first {
//            participants.first { $0.name == person.name }?.interests.append(myNewInterest)
//        }

            participants.first { $0.name == person.name }?.interests.append(interest)
        
    }
    
    func hasFinished(person: Person, within participants: [Person]) {
        
        participants.first { $0.name == person.name }?.finishedAddingInterests = true
    }
}

