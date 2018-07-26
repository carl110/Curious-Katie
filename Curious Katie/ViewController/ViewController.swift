//
//  ViewController.swift
//  Curious Katie
//
//  Created by Carl Wainwright on 07/06/2018.
//  Copyright © 2018 Carl Wainwright. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    
    
    //Declares hobby is the name array from Interest file
    var hobby = Interest.generateGeneralHobbies()
    //pull list of random participants through
    var participants = Person.generateParticipants(amount: Int(arc4random_uniform(10)) + 2)
    //declare value for participantCoutIncrease
    var participantCountIncrease = 0
    var valueIncrease = 0
//    //Create empty Dctionary with Array
//    var interestDictionary = [String: [String]]()
    //declares data used in UIPickerView
    var interestsData = [String]()
    

    
    
    @IBOutlet weak var interestsPickerView: UIPickerView!
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

        participants.forEach{ (participant) in
            print("My name is \(participant.name) \(participant.finishedAddingInterests)")
                participant.interests.forEach{ (interest) in
                print ("I like \(interest.name), which is \(interest.description). And this requires \(interest.requiredEquipment)")
                }
        }
        valueIncrease += 1
        
        

    }
    
    
    @IBAction func startAddingInterests(_ sender: UIButton) {
        
        
        
        print("\(participants[participantCountIncrease].name) please select your interests from the list.")
        
        startAddingInterests.disableButton()
        addInterest.enableButton()

        
        interestsPickerView.isHidden = false
        
        
        
    }
    
    @IBAction func addInterest(_ sender: UIButton) {
        
       
        //*************filters participants, but removes them - change to if participant filter is true then continue or next participant
//        participants = participants.filter {$0.finishedAddingInterests == false}
        
        if participants[participantCountIncrease].finishedAddingInterests == true {
            //increases participantcount by 1
            participantCountIncrease += 1
            
            print("\(participants[participantCountIncrease].name) please select your interests from the list.")
            
        }

        //increases participantcount by 1
        participantCountIncrease += 1

 
        
        //Only show one available participant in order
        if participantCountIncrease < participants.count - 1  {

            //Reloads array with Interests from hobby
            interestsData = hobby.map({$0.name})
            
            //reload pickerview after the prior removal above
            interestsPickerView.delegate = self
            
            //Reloads the pickerview to show all interests
            interestsPickerView.reloadAllComponents()
            

            
            print("\(participants[participantCountIncrease].name) please select your interests from the list.")
            

            
            //Let newInterestName equal the selected row in pickerview
            let newInterestName = interestsData[interestsPickerView.selectedRow(inComponent: 0)]
            //lookup against hobbby to pull description
            let newDescription = hobby.map({$0.description})[hobby.map({$0.name}).index(of: "\(interestsData[interestsPickerView.selectedRow(inComponent: 0)])")!]
            //lookup against hobby to pull required equipment
            let newRequiredEquipment = hobby.map({$0.requiredEquipment})[hobby.map({$0.name}).index(of: "\(interestsData[interestsPickerView.selectedRow(inComponent: 0)])")!]
            
            //make new interest from structure of Interest with the name as newInterestName
            let newInterest = Interest(name: newInterestName, description: newDescription, requiredEquipment: newRequiredEquipment)
            
            //Append newInterest to the selected participant
            participants.first { $0.name == participants[participantCountIncrease].name }?.interests.append(newInterest)
            
//            //remove selected data from pickerview
//            interestsData.remove(at: interestsPickerView.selectedRow(inComponent: 0))
            


            
                    noMoreInterests.enableButton()
        }
        if participantCountIncrease == participants.count {
            participantCountIncrease = 0
            
            //interestsData = hobby.filter {$0.name == "\(participants[participantCountIncrease].interests)"}

            
            //Reloads array with Interests from hobby
            //interestsData = hobby.map({$0.name})
            
            //reload pickerview after the prior removal above
            interestsPickerView.delegate = self
            
            //Reloads the pickerview to show all interests
            interestsPickerView.reloadAllComponents()
            
            
            
            print("\(participants[participantCountIncrease].name) please select your interests from the list.")
            
            
            
            //Let newInterestName equal the selected row in pickerview
            let newInterestName = interestsData[interestsPickerView.selectedRow(inComponent: 0)]
            //lookup against hobbby to pull description
            let newDescription = hobby.map({$0.description})[hobby.map({$0.name}).index(of: "\(interestsData[interestsPickerView.selectedRow(inComponent: 0)])")!]
            //lookup against hobby to pull required equipment
            let newRequiredEquipment = hobby.map({$0.requiredEquipment})[hobby.map({$0.name}).index(of: "\(interestsData[interestsPickerView.selectedRow(inComponent: 0)])")!]
            
            //make new interest from structure of Interest with the name as newInterestName
            let newInterest = Interest(name: newInterestName, description: newDescription, requiredEquipment: newRequiredEquipment)
            
            //Append newInterest to the selected participant
            participants.first { $0.name == participants[participantCountIncrease].name }?.interests.append(newInterest)
            
            //            //remove selected data from pickerview
            //            interestsData.remove(at: interestsPickerView.selectedRow(inComponent: 0))
            
            
            
            
            noMoreInterests.enableButton()
        }
        
        
      
        
       
        
//        //Add each interest to new array for each participant
//        interestDictionary["\(participants[participantCountIncrease].name)"] = (interestDictionary["\(participants[participantCountIncrease].name)"] ?? []) + ["\(interestsData[interestsPickerView.selectedRow(inComponent: 0)])"]
        
        

        
        

        

        
        
    }
    
    @IBAction func noMoreInterests(_ sender: UIButton) {
        
        //Trying to find way of amenind finishedAddingInterest falg as true for participant
        participants[participantCountIncrease].finishedAddingInterests = true
 
        
//
//            addInterest.disableButton()
////            noMoreInterests.disableButton()
            playerList.enableButton()
//            interestsPickerView.isHidden = true
        
        
        

        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        interestsData = hobby.map({$0.name})
        interestsPickerView.dataSource = self
        interestsPickerView.delegate = self
        
        
        playerList.disableButton()
        startAddingInterests.disableButton()
        addInterest.disableButton()
        noMoreInterests.disableButton()
        
        interestsPickerView.isHidden = true
        
        
        
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return interestsData.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return interestsData[row]
        
    }

}
