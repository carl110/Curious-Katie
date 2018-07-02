//
//  ViewController.swift
//  Curious Katie
//
//  Created by Carl Wainwright on 07/06/2018.
//  Copyright © 2018 Carl Wainwright. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

//    let CMV = RandomGenerator()
    let hobby = Interest.generateGeneralHobbies()
    //pull list of random partyicipants through
    let participant = Person.generateParticipants(amount: Int(arc4random_uniform(10)) + 2)
    
    
    @IBAction func showParticipants(_ sender: UIButton) {
        //Print name and attributes of participants
        participant.forEach { (participant) in
            print("My name is \(participant.name), I am \(participant.gender.rawValue) aged \(participant.age) and I live in \(participant.city ?? "Paris")")
            
        }
        
    }
    
    
    
    @IBOutlet weak var interests: UIPickerView!
//
//    var interestsData : [Person.Gender] = []
//
//
    
    
    
    
    @IBAction func next(_ sender: UIButton) {


        for i in hobby {
            print (i.name)
        }
        


//        print (participant[1].name)
//        print (participant.count)
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
//        CMV.randomiser()
//



////
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

