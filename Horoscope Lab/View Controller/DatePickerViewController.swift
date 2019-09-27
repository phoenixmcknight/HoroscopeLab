//
//  ViewController.swift
//  Horoscope Lab
//
//  Created by Phoenix McKnight on 9/24/19.
//  Copyright © 2019 Phoenix McKnight. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITextFieldDelegate {
    
    @IBOutlet weak var dateLabel: UILabel!
    
    @IBOutlet weak var textFieldOutlet: UITextField!
    
    @IBOutlet weak var datePickerOutlet: UIDatePicker!
   
    @IBOutlet weak var yourName: UILabel!
    
    var dateVar: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textFieldOutlet.delegate = self
        if UserDataWrapper.shared.getUsername() == nil {
        yourName.text = ""
        } else {
            yourName.text = UserDataWrapper.shared.getUsername()
        }
        if UserDataWrapper.shared.getBirthdayData() == nil {
            dateVar = ""
        } else {
            dateVar = UserDataWrapper.shared.getBirthdayData()!
            
        }
        // Do any additional setup after loading the view.
    }

    @IBAction func datePickerAction(_ sender: UIDatePicker) {
       
        let dateFormatter = DateFormatter()
        
        dateFormatter.dateStyle = DateFormatter.Style.short
        let strDate = dateFormatter.string(from: datePickerOutlet.date)
        dateLabel.text = strDate
        dateVar = strDate
        UserDataWrapper.shared.store(birthday: strDate)
        
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        yourName.text = textField.text
       
        UserDataWrapper.shared.setUserName(name: textField.text!)
        return true
    }
    @IBAction func buttonAction(_ sender: UIButton) {
   
        let storyBoard = storyboard?.instantiateViewController(withIdentifier: "SelectHoroscopeVC") as! SelectHoroscopeVC
        
        
        navigationController?.pushViewController(storyBoard, animated: true)
        
    }
    
}

