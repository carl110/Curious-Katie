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
    var hobby = Interest.name
    //pull list of random participants through
    var participants = Person.generateParticipants(amount: Int(arc4random_uniform(10)) + 2)
  
    //declare value for participantCoutIncrease
    var participantCountIncrease = 0
    
    //Create empty Dctionary with Array
    var interestDictionary = [String: [String]]()

  
    
    //declares data used in UIPickerView
    var interestsData = [String]()
    
    @IBAction func showParticipants(_ sender: UIButton) {
        

        //Print name and attributes of all participants
        participants.forEach { (participant) in
            print("My name is \(participant.name), I am \(participant.gender.rawValue) aged \(participant.age) and I live in \(participant.city ?? "Paris")")
            

        }
        
    }
    
    
    
    @IBOutlet weak var interests: UIPickerView!
    
   

    
    
    
    
    @IBAction func next(_ sender: UIButton) {
        
        print (interestDictionary)
        

    }
    
    
    @IBAction func nextParticipant(_ sender: UIButton) {
        


            print("\(participants[participantCountIncrease].name) please select your interests from the list.")
            
            
  
            

    
   
    }
    
    @IBAction func addInterest(_ sender: UIButton) {
        
        //*****Ignore****** prints interest
        //print (interestsData[interests.selectedRow(inComponent: 0)])

        //append interest to name in array (need to see about doing dict or something else)
       // participants[participantCountIncrease].name.append(interestsData[interests.selectedRow(inComponent: 0)])
        
        //Add each interest to new array for each participant
        interestDictionary["\(participants[participantCountIncrease].name)"] = (interestDictionary["\(participants[participantCountIncrease].name)"] ?? []) + ["\(interestsData[interests.selectedRow(inComponent: 0)])"]

        
        
        //remove selected data from pickerview
        interestsData.remove(at: interests.selectedRow(inComponent: 0))


        //reload pickerview after the prior removal above
        interests.delegate = self
        
        
        //participants["hobby"] = "\(interestsData[interests.selectedRow(inComponent: 0)])"

//        participants[participantCountIncrease].name.append("\n \(interestsData[interests.selectedRow(inComponent: 0)])")
        
      //  hobby [hobby] = "\(interestsData[interests.selectedRow(inComponent: 0)])"


    //    var newInterest =  interestsData[interests.selectedRow(inComponent: 0)]
        
       // participants[participantCountIncrease].name.append(newInterest)
        

        
    }
    
    @IBAction func noMoreInterests(_ sender: UIButton) {
        
        //Only show one available participant in order
        if participantCountIncrease < participants.count {
         
            //increases participantcount by 1
            participantCountIncrease += 1
            
            //Reloads array with Interests from hobby
            interestsData = hobby
            
            //Reloads the pickerview to show all interests
            interests.reloadAllComponents()
        }
        
        
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

