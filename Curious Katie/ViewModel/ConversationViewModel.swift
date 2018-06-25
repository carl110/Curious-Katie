//
//  ConversationModelView.swift
//  Curious Katie
//
//  Created by Carl Wainwright on 18/06/2018.
//  Copyright © 2018 Carl Wainwright. All rights reserved.
//

import Foundation


class RandomGenerator {
    
    
   let convo = Conversation()
    
    var randPlayer: ArraySlice<String> = []
    
    func randomiser(){
        //randomise number between 2 and 12
        let num = Int(arc4random_uniform(10)+2)
        //create array of player array up the number from num
        randPlayer = Conversation().player[0..<num]

    }
}

