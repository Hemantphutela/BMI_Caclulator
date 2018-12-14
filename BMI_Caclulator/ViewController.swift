//
//  ViewController.swift
//  BMI_Caclulator
//
//  Created by Hemant Phutela on 13/12/2018.
//  Copyright © 2018 Hemant Phutela. All rights reserved.
//

import UIKit


//var bmi = ""
//var height = ""
//var weight = ""

class ViewController: UIViewController {

    
    @IBOutlet weak var Name: UITextField!
    
    @IBOutlet weak var Age: UITextField!
    
    @IBOutlet weak var Gender: UITextField!
    
    @IBOutlet weak var Weight: UITextField!
    
    
    @IBOutlet weak var Height: UITextField!
   
    
    @IBOutlet weak var BMI: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func calBmi(_ sender: AnyObject) {
        
        if(self.Height.text!=="" && self.Weight.text!=="")
        {
            return
        }
        let height = Float(self.Height.text!)!
        let weight = Float(self.Weight.text!)!
        let heightsquare = height*height
        var bmi:Float = weight/heightsquare
        
        self.BMI.text = "Hello \(self.Name.text!) Your bmi is \(String(bmi))"
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

