//
//  userData.swift
//  Horoscope Lab
//
//  Created by Phoenix McKnight on 9/24/19.
//  Copyright © 2019 Phoenix McKnight. All rights reserved.
//

import Foundation
import UIKit

struct UserDataWrapper {
    static let shared = UserDataWrapper()
    
    private let username = "Username"
    private let sign = "sign"
    private let birthdayData = "birthday"
   
    
    func setSign(horoscope:String) {
        UserDefaults.standard.set(horoscope, forKey: sign)
    }
    
    func getSign() -> String? {
      return  UserDefaults.standard.value(forKey: sign) as? String
        
    }
    func useSign() -> String {
   let sign = getSign()?.components(separatedBy: ",")
        return sign![0].lowercased()
    }
    
    func store(birthday:String) {
        UserDefaults.standard.set(birthday, forKey: birthdayData)
    }
    func getBirthdayData() -> String? {
        return UserDefaults.standard.value(forKey: birthdayData) as? String
    }
    
    func determineSign(row:Int) -> String {
        switch row {
        case 1:
        return "aries"
        case 2:
        return "taurus"
        case 3:
           return "gemini"
        case 4:
            return "cancer"
        case 5:
            return "leo"
        case 6:
            return "virgo"
        case 7:
            return "libra"
        case 8:
            return "scorpio"
        case 9:
            return "sagittarius"
        case 10:
            return "capriocorn"
        case 11:
            return "capricorn"
        case 12:
            return "pisces"
        default:
            return "nothing"
    }
    }
    func setUserName(name:String) {
  UserDefaults.standard.set(name, forKey: username)
    }
    
    func getUsername() -> String? {
    return UserDefaults.standard.value(forKey: username) as? String
    }
    
    

}
    


