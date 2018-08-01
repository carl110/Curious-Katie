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
    var hobby = Interest.generateGeneralHobbies()

    
    
    
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
        addInterests.enableButton()
        interestsPickerView.reloadAllComponents()
 
    }
    
    
    @IBAction func addInterests(_ sender: UIButton) {


        //if interests have been depleted then automatically run noMoreInterests button
        if viewModel.currentPersonAvailableInterests.count == 1 {
            noMoreInterests(sender)
        }
        else {
        //index lookup for descrition of interest
        let newDescription = hobby.map({$0.description})[hobby.map({$0.name}).index(of: "\(viewModel.currentPersonAvailableInterests[interestsPickerView.selectedRow(inComponent: 0)])")!]
        //index lookup for requiredEquipment for interests
        let newRequiredEquipment = hobby.map({$0.requiredEquipment})[hobby.map({$0.name}).index(of: "\(viewModel.currentPersonAvailableInterests[interestsPickerView.selectedRow(inComponent: 0)])")!]
        //add selected interest to Person array
        viewModel.updateParticipant(person: currentParticipant, within: participants, with: Interest(name: viewModel.currentPersonAvailableInterests[interestsPickerView.selectedRow(inComponent: 0)], description: newDescription, requiredEquipment: newRequiredEquipment))
        //call next participant
        nextParticipant()
        //reload pickerview with updated interests
        interestsPickerView.reloadAllComponents()
        }
        //disbles noMoreInterestbutton if participant has not selected any interests
        if viewModel.currentPersonAvailableInterests.count == 10 {
            noMoreInterests.disableButton()
        }
        //enables noMoreInterests button if participant has atleast 1 interest added
        if viewModel.currentPersonAvailableInterests.count < 10 {
            noMoreInterests.enableButton()
        }
        
    }
    
    
    
    @IBAction func noMoreInterests(_ sender: UIButton) {
        
        //calls function to change finishedAddingInterests Boolean to true
        viewModel.hasFinished(person: currentParticipant, within: participants)
        nextParticipant()
        interestsPickerView.reloadAllComponents()
        //if all participants have finished adding interests then enable/disable buttons
        let filtered = participants.filter { $0.finishedAddingInterests == true }
        if filtered.count == participants.count {
            compareInterests.enableButton()
            noMoreInterests.disableButton()
            addInterests.disableButton()
        }

        
    }
    
    
    
    
    @IBAction func compareInterests(_ sender: UIButton) {
        
        //Print participants with thier interests and data
        participants.forEach{ (participant) in
            print("\n\n My name is \(participant.name)")
            participant.interests.forEach{ (interest) in
                print ("I like \(interest.name), which is \(interest.description).\n And this requires \(interest.requiredEquipment)")
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
        
        addInterests.disableButton()
        noMoreInterests.disableButton()
        compareInterests.disableButton()
        
        
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

