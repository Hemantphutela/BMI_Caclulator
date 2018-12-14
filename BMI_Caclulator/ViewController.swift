//
//  ViewController.swift
//  BMI_Caclulator
//
//  Created by Hemant Phutela on 13/12/2018.
//  Copyright © 2018 Hemant Phutela. All rights reserved.
//

import UIKit
import CoreData

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
    
    var context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func calBmi(_ sender: AnyObject) {
        
        if(self.Height.text!=="" && self.Weight.text!=="")
        {
            return
        }
        // Calculating BMI
        let height = Float(self.Height.text!)!
        let weight = Float(self.Weight.text!)!
        let heightsquare = height*height
        var bmi:Float = weight/heightsquare
        var descriptor = ""
        
        if(bmi < 16.0) { descriptor = "Severely Thin" }
        else if(bmi < 16.99) { descriptor = "Moderately Thin" }
        else if(bmi < 18.49) { descriptor = "Slightly Thin" }
        else if(bmi < 24.99) { descriptor = "Normal" }
        else if(bmi < 29.99) { descriptor = "Overweight" }
        else if(bmi < 34.99) { descriptor = "Moderately Obese" }
        else if(bmi < 39.99) { descriptor = "Severely Obese" }
        else { descriptor = "Very Severely Obese" }
        
        self.BMI.text = "\(String(bmi)) is \(descriptor)"
        // Saving data to core data
        let newUser = NSEntityDescription.insertNewObject(forEntityName: "User", into: context)
        newUser.setValue(self.Name!.text, forKey: "name")
        newUser.setValue(self.BMI!.text, forKey: "bmi")
        //newUser.setValue(self.descriptor!, forKey: "desc")
        
        do{
            try context.save()
        }catch{
            print(error)
        }
    }
   
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

