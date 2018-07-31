//
//  ViewController.swift
//  Curious Katie
//
//  Created by Carl Wainwright on 07/06/2018.
//  Copyright © 2018 Carl Wainwright. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    //create empty array for participants
    var participants: [Person] = []
    //Random number generator between 2 and 12
    let participantCount = Int(arc4random_uniform(10))+2
    //pull viewModel through to be used in this file
    let viewModel = ViewModel()
    //currentParticipant is equat to an object from Person
    var currentParticipant: Person!
    
    
    
    
    @IBOutlet weak var interestsPickerView: UIPickerView!
    @IBOutlet weak var showParticipants: UIButton!
    @IBOutlet weak var compareInterests: UIButton!
    @IBOutlet weak var addInterests: UIButton!
    @IBOutlet weak var noMoreInterests: UIButton!
    @IBOutlet weak var participantLabel: UILabel!
    
    
    
    @IBAction func showParticipants(_ sender: UIButton) {
        
        //Print name and attributes of all participants
        participants.forEach { (participant) in
            print ("My name is \(participant.name), I am \(participant.gender.rawValue) aged \(participant.age) and I live in \(participant.city ?? "Paris")")
        }
        
        nextParticipant()
        showParticipants.disableButton()
        
        interestsPickerView.reloadAllComponents()
        //participantList.forEach { (participant) in
        //            print("My name is \(participant.name), I am \(participant.gender.rawValue) aged \(participant.age) and I live in \(participant.city ?? "Paris")")
        //
        //            showParticipants.disableButton()
        //            startAddingInterests.enableButton()
        //
        //        }
        
    }
    
    
    @IBAction func addInterests(_ sender: UIButton) {
        
        
        
        viewModel.updateParticipant(person: currentParticipant, within: participants, with: Interest(name: viewModel.currentPersonAvailableInterests[interestsPickerView.selectedRow(inComponent: 0)], description: "", requiredEquipment: ""))
        
        nextParticipant()
        
        interestsPickerView.reloadAllComponents()
        //        if let myNewInterest = (hobby.filter{ $0.name == newInterestName }).first {
        //            participants.first { $0.name == participants[participantCountIncrease].name }?.interests.append(myNewInterest)}
        
        
        //print("\(participants[participantCountIncrease].name) please select your interests from the list.")
        
        //        startAddingInterests.disableButton()
        //        addInterest.enableButton()
        //
        //        interestsPickerView.isHidden = false
        
        
        
    }
    
    
    
    @IBAction func noMoreInterests(_ sender: UIButton) {
        
        
        viewModel.hasFinished(person: currentParticipant, within: participants)
        nextParticipant()
        interestsPickerView.reloadAllComponents()
        
        compareInterests.enableButton()
        
    }
    
    
    
    
    @IBAction func compareInterests(_ sender: UIButton) {
        
        participants.forEach{ (participant) in
            print("\n My name is \(participant.name)")
            participant.interests.forEach{ (interest) in
                print ("I like \(interest.name), which is \(interest.description). And this requires \(interest.requiredEquipment)")
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        participants = Person.generateParticipants(amount: participantCount)
        //        interestsData = hobby.map({$0.name})
        interestsPickerView.dataSource = self
        interestsPickerView.delegate = self
        
        participantLabel.text = ""
        
        
        
    }
    
    func nextParticipant() {
        
        //
        viewModel.getRandomPerson(participants: participants, onSuccess: { (name) in currentParticipant = name
            
            participantLabel.text = ("\(currentParticipant.name) choose your next interest.")
        })
        {
            participantLabel.text = "Selections Complete"
            interestsPickerView.isHidden = true
            
        }
    }
    
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return viewModel.currentPersonAvailableInterests.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return viewModel.currentPersonAvailableInterests[row]
        
    }
    
    
}

