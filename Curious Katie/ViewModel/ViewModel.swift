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


    //looks at Person structure
    func getRandomPerson(participants: [Person], onSuccess: (Person) -> Void, onFinish: () -> Void) {
        //filters finishedAddingInterest tag to only false
        let filtered = participants.filter { $0.finishedAddingInterests == false }
        //if 0 then finish
        if filtered.count == 0 {
            onFinish()
        }
        else {
            //uses filtered from above and randomly selects a number upto the filter count
            let randomPerson = filtered[Int(arc4random_uniform(UInt32(filtered.count)))]
            //pulls out interests associated with participant
            getAvailableInterests(of: randomPerson)
            onSuccess(randomPerson)
        }
    }
    
    func getAvailableInterests(of person: Person) {
        //turn the arrays to sets to allow unique comparisons
        let set1: Set<String> = Set(person.interests.map{ $0.name })
        let set2: Set<String> = Set(Interest.generateGeneralHobbies().map({$0.name}))
        //removes removes the already selected interests from pickerview for the selected participant
        currentPersonAvailableInterests = Array(set2.subtracting(set1))
    }
    
    func updateParticipant(person: Person, within participants: [Person], with interest: Interest) {
        //append interest slected for participant
        participants.first { $0.name == person.name }?.interests.append(interest)
        
    }
    
    func hasFinished(person: Person, within participants: [Person]) {
        //changes finishedAddingInterests flag to true for selected participant
        participants.first { $0.name == person.name }?.finishedAddingInterests = true
    }
}

