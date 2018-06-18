//
//  ConversationModelView.swift
//  Curious Katie
//
//  Created by Carl Wainwright on 18/06/2018.
//  Copyright © 2018 Carl Wainwright. All rights reserved.
//

import Foundation
import UIKit

class RandomGenerator {
    
    
   let convo = Conversation()
    
    func randomiser(){
        let num = Int(arc4random_uniform(6)+2)
        
        _ = Conversation().player[0..<num]
        
    }
}

