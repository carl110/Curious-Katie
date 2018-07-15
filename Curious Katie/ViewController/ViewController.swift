//
//  ViewController.swift
//  Curious Katie
//
//  Created by Carl Wainwright on 07/06/2018.
//  Copyright © 2018 Carl Wainwright. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return interestsData.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return interestsData[row]
    }


    let hobby = Interest.name
    //pull list of random partyicipants through
    var participants = Person.generateParticipants(amount: Int(arc4random_uniform(10)) + 2)
    
    var interestsData = [String]()
    
    @IBAction func showParticipants(_ sender: UIButton) {
        //Print name and attributes of participants
        participants.forEach { (participant) in
            print("My name is \(participant.name), I am \(participant.gender.rawValue) aged \(participant.age) and I live in \(participant.city ?? "Paris")")
            
        }
        
    }
    
    
    
    @IBOutlet weak var interests: UIPickerView!
    
   

    
    
    
    
    @IBAction func next(_ sender: UIButton) {



        
    }
    
    
    @IBAction func nextParticipant(_ sender: UIButton) {
    }
    
    @IBAction func addInterest(_ sender: UIButton) {
    }
    
    @IBAction func noMoreInterests(_ sender: UIButton) {
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        interestsData = hobby
        interests.dataSource = self
        interests.delegate = self



    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

