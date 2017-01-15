//
//  ViewController.swift
//  Storing Data Locally
//
//  Created by Atıl Samancıoğlu on 05/12/2016.
//  Copyright © 2016 Atıl Samancıoğlu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var birthdayLabel: UILabel!
    @IBOutlet weak var nameText: UITextField!
    @IBOutlet weak var birthDayText: UITextField!
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
     let storedName = UserDefaults.standard.object(forKey: "namesurname")
     let storedDate = UserDefaults.standard.object(forKey: "birthday")
        
    
        if let newName = storedName as? String {
            nameLabel.text = "Name: \(newName)"
        }
        
        if let newDate = storedDate as? String {
            birthdayLabel.text = "Birthday: \(newDate)"
        }
    
    }

    @IBAction func deleteButtonClicked(_ sender: Any) {
        
        let storedName = UserDefaults.standard.object(forKey: "namesurname")
        let storedDate = UserDefaults.standard.object(forKey: "birthday")
        
        if let _ = storedName as? String {
            UserDefaults.standard.removeObject(forKey: "namesurname")
            UserDefaults.standard.synchronize()
            
            nameLabel.text = "Name: "
            nameText.text = ""
            
        }
        
        if let _ = storedDate as? String {
            
            UserDefaults.standard.removeObject(forKey: "birthday")
            UserDefaults.standard.synchronize()
            
            birthDayText.text = ""
            birthdayLabel.text = "Birthday: "
            
        }

        
    }

    @IBAction func saveButtonClicked(_ sender: Any) {
        
        UserDefaults.standard.set(nameText.text, forKey: "namesurname")
        UserDefaults.standard.set(birthDayText.text, forKey: "birthday")
        UserDefaults.standard.synchronize()
        
        nameLabel.text = "Name: \(nameText.text!)"
        birthdayLabel.text = "Birthday: \(birthDayText.text!)"
    }
 

}

