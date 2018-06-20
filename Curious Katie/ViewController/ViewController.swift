//
//  ViewController.swift
//  Curious Katie
//
//  Created by Carl Wainwright on 07/06/2018.
//  Copyright © 2018 Carl Wainwright. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let CMV = RandomGenerator()
    
    

    
    @IBOutlet weak var interests: UIPickerView!
    

    
    @IBAction func next(_ sender: UIButton) {
        print (CMV.randPlayers)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        CMV.randomiser()   }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

