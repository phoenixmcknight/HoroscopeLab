//
//  horoscopeVC.swift
//  Horoscope Lab
//
//  Created by Phoenix McKnight on 9/24/19.
//  Copyright © 2019 Phoenix McKnight. All rights reserved.
//

import Foundation
import UIKit

class HoroscopeVC:UIViewController {
    
    @IBOutlet weak var birhtdayLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var horoscopeLabel: UILabel!
    
    @IBOutlet weak var textViewOutlet: UITextView!
    
    var horoscope:Horoscope!{
        didSet {
            setUp()
        }
    }
    
    func getData() {
         let sign = UserDataWrapper.shared.useSign()
        
        HoroscopeAPIClient.shared.getHoroscope(horoscope:sign) { (results) in
            DispatchQueue.main.async {
                switch results {
                case .failure(let error):
                    print(error)
                case .success(let data):
                    self.horoscope = data
                
                }
            }


        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getData()
        
    }
    
    func setUp() {
        nameLabel.text = UserDataWrapper.shared.getUsername()
        horoscopeLabel.text = UserDataWrapper.shared.getSign()?.capitalized
       textViewOutlet.text = horoscope.horoscope
        birhtdayLabel.text = UserDataWrapper.shared.getBirthdayData()
    }
}
