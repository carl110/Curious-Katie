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
    
    
    //Declares hobby is the name array from Interest file
    var hobby = Interest.generateGeneralHobbies()
    //pull list of random participants through
    var participants = Person.generateParticipants(amount: Int(arc4random_uniform(10)) + 2)
    
    //declare value for participantCoutIncrease
    var participantCountIncrease = 0
    
    var valueIncrease = 0
    //Create empty Dctionary with Array
    var interestDictionary = [String: [String]]()
    
    
    
    //declares data used in UIPickerView
    var interestsData = [String]()
    
    
    
    @IBOutlet weak var interests: UIPickerView!
    
    @IBOutlet weak var showParticipants: UIButton!
    @IBOutlet weak var playerList: UIButton!
    @IBOutlet weak var startAddingInterests: UIButton!
    @IBOutlet weak var addInterest: UIButton!
    @IBOutlet weak var noMoreInterests: UIButton!
    
    @IBAction func showParticipants(_ sender: UIButton) {
        
        //Print name and attributes of all participants
        participants.forEach { (participant) in
            print("My name is \(participant.name), I am \(participant.gender.rawValue) aged \(participant.age) and I live in \(participant.city ?? "Paris")")
            
            showParticipants.disableButton()
            startAddingInterests.enableButton()

            
        }
    }

    
    
    
    
    
    
    
    @IBAction func playerList(_ sender: UIButton) {
        

        
        
        interestDictionary.forEach { (participant) in
            
            
            //valueIncrease increases array count to show 1 at a time ******** need to find a way to have if statement or something to not cause error when key does not have many values as the others
            print ("My name is \(participant.key) and I like \(participant.value[valueIncrease])")
            
//            if participant.value == hobby.map({$0.name}) {
//                print (hobby.map({$0.description}))
//            }
            
        }

        
        valueIncrease += 1
        
        

    }
    
    
    @IBAction func startAddingInterests(_ sender: UIButton) {
        
        
        
        print("\(participants[participantCountIncrease].name) please select your interests from the list.")
        
        startAddingInterests.disableButton()
        addInterest.enableButton()

        
        interests.isHidden = false
        
        
        
    }
    
    @IBAction func addInterest(_ sender: UIButton) {
        
        //Add each interest to new array for each participant
        interestDictionary["\(participants[participantCountIncrease].name)"] = (interestDictionary["\(participants[participantCountIncrease].name)"] ?? []) + ["\(interestsData[interests.selectedRow(inComponent: 0)])"]
        
        
        //remove selected data from pickerview
        interestsData.remove(at: interests.selectedRow(inComponent: 0))
        
        
        //reload pickerview after the prior removal above
        interests.delegate = self
        
        noMoreInterests.enableButton()
        
        
    }
    
    @IBAction func noMoreInterests(_ sender: UIButton) {
        
        //increases participantcount by 1
        participantCountIncrease += 1
        
        //Only show one available participant in order
        if participantCountIncrease < participants.count {
            
            print("\(participants[participantCountIncrease].name) please select your interests from the list.")
            
            //Reloads array with Interests from hobby
            interestsData = hobby.map({$0.name})
            
            //Reloads the pickerview to show all interests
            interests.reloadAllComponents()
        }
        else {
            
            addInterest.disableButton()
            noMoreInterests.disableButton()
            playerList.enableButton()
            interests.isHidden = true
            
        }
        
        noMoreInterests.disableButton()
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        interestsData = hobby.map({$0.name})
        interests.dataSource = self
        interests.delegate = self
        
        
        playerList.disableButton()
        startAddingInterests.disableButton()
        addInterest.disableButton()
        noMoreInterests.disableButton()
        
        interests.isHidden = true
        
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

