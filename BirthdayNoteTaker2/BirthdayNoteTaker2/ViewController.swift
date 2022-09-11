//
//  ViewController.swift
//  BirthdayNoteTaker2
//
//  Created by Tekin Aksel Demir on 28.08.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var birthdayTextField: UITextField!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var birthdayLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let storedName = UserDefaults.standard.object(forKey: "name")
        let storedBirthday = UserDefaults.standard.object(forKey: "birthday")
        
        //Casting - as? vs. as! force casting
        
        if let newName = storedName as? String {
            nameLabel.text = "Name : \(newName)"
        }
        if let newBirthday = storedBirthday as? String {
            birthdayLabel.text = "Birthday : \(newBirthday)"
        }
    }

    @IBAction func save(_ sender: Any) {
        
        UserDefaults.standard.set(nameTextField.text!, forKey: "name")
        UserDefaults.standard.set(birthdayTextField.text!, forKey: "birthday")
        //UserDefaults.synchronize(<#T##self: UserDefaults##UserDefaults#>) artık kullanılmıyor gereği yok
        
        nameLabel.text = "Name : \(nameTextField.text!)"
        birthdayLabel.text = "Birthday : \(birthdayTextField.text!)"
        
    }
    
    @IBAction func deleteClicked(_ sender: Any) {
        
        let storedName = UserDefaults.standard.object(forKey: "name")
        let storedBirthday = UserDefaults.standard.object(forKey: "birthday")
        
        // "" vs nil
        
        if (storedName as? String) != nil {
            UserDefaults.standard.removeObject(forKey: "name")
            nameLabel.text = "Name :"
        }
        
        if (storedBirthday as? String) != nil {
            UserDefaults.standard.object(forKey: "birthday")
            birthdayLabel.text = "Birthday :"
        }
    }
    
}

