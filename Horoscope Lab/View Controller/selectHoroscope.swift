//
//  selectHoroscope.swift
//  Horoscope Lab
//
//  Created by Phoenix McKnight on 9/26/19.
//  Copyright © 2019 Phoenix McKnight. All rights reserved.
//

import Foundation
import UIKit

class SelectHoroscopeVC: UIViewController,UIPickerViewDelegate, UIPickerViewDataSource {
   
    
    @IBOutlet weak var buttonOutlet: UIButton!
    
    
    @IBOutlet weak var pickerOutlet: UIPickerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pickerOutlet.delegate = self
        pickerOutlet.dataSource = self
       
        buttonOutlet.setTitle("Please select a horoscope", for: .normal)
      
        buttonOutlet.isEnabled = false
    }




    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return Horoscopes.horoscopes.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
       
        
        return Horoscopes.horoscopes[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        
        
        UserDataWrapper.shared.setSign(horoscope: UserDataWrapper.shared.determineSign(row: row))
   
        if let wrap =  UserDataWrapper.shared.getSign() {
      let  horoscopeString = "Your Horoscope is \(wrap.capitalized). Click to receive information about your sign."
            buttonOutlet.setTitle(horoscopeString, for: .normal)
            buttonOutlet.isEnabled = true
           
        }
        
    }
    
    @IBAction func selectButtonAction(_ sender: UIButton) {
  
        let horoscopeVCStoryBoard = storyboard?.instantiateViewController(withIdentifier: "HoroscopeVC") as! HoroscopeVC
        
        navigationController?.pushViewController(horoscopeVCStoryBoard, animated: true)
    }
}





