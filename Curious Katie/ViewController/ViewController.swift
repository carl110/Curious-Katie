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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //declatres participants as populated participants
        participants = Person.generateParticipants(amount: participantCount)
        interestsPickerView.dataSource = self
        interestsPickerView.delegate = self
        participantLabel.text = ""
        addInterests.disableButton()
        noMoreInterests.disableButton()
        compareInterests.disableButton()
    }
  
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
            //newInterests looks up name in pickerview and pulls out data from hobby, using the name to filter - then add name description and required equipment to the Person array
            if let newInterest = (hobby.filter{$0.name == viewModel.currentPersonAvailableInterests[interestsPickerView.selectedRow(inComponent: 0)]}).first {
                viewModel.updateParticipant(person: currentParticipant, within: participants, with: newInterest)
            }
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
        else {
            //call next participant
            nextParticipant()
            //reload pickerview with updated interests
            interestsPickerView.reloadAllComponents()
            //check if participant has any interests selected, if not then disable button
            if viewModel.currentPersonAvailableInterests.count == 10 {
                noMoreInterests.disableButton()
            }
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
        //print a list of participants with paticipants who have atleast one different interest
        participants.forEach { (participant) in
            let matches = participants.filter{$0.interests != participant.interests}

            print ("\n\(participant.name) can be paired with:")
            matches.forEach { (matchedPerson) in
                print (matchedPerson.name)
            }
        }
        
        compareInterests.disableButton()
        participantLabel.text = ("Paring suggestions can now be found /n on the Target Output in XCode")
    }
    

    
    func nextParticipant() {
        
        //uses function from viewModel to get a random participant to display
        viewModel.getRandomPerson(participants: participants, onSuccess: { (name) in currentParticipant = name
            //print participant name in UILabel
            participantLabel.text = ("\(currentParticipant.name) choose your next interest.")
        })
        { //this is the onFinish section of getRandomPerson
            participantLabel.text = "Selections Complete"
            interestsPickerView.isHidden = true
        }
    }
    //number of columns for pickerView
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    //number of rows for pickerView
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return viewModel.currentPersonAvailableInterests.count
    }
    //data for pickerview
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return viewModel.currentPersonAvailableInterests[row]
        
    }
    
    
}

