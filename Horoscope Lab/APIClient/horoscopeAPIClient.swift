//
//  horoscopeAPIClient.swift
//  Horoscope Lab
//
//  Created by Phoenix McKnight on 9/24/19.
//  Copyright © 2019 Phoenix McKnight. All rights reserved.
//

import Foundation
import UIKit

class HoroscopeAPIClient {
    
   static let shared = HoroscopeAPIClient()
    
    func getHoroscope(horoscope:String, completionHandler:@escaping (Result<Horoscope,AppError>) -> Void) {
        let urlstr = "http://sandipbgt.com/theastrologer/api/horoscope/\(horoscope)/today/"
        
        guard let url = URL(string: urlstr) else {
            completionHandler(.failure(.badURL))
            return
        }
        NetworkHelper.manager.performDataTask(withUrl: url, andMethod: .get) {
            (results) in
            switch results {
            case .failure(let error):
                completionHandler(.failure(error))
            case .success(let data):

                do {
                    let horoscopeData = try JSONDecoder().decode(Horoscope.self, from: data)
                    
                    completionHandler(.success(horoscopeData))
                } catch {
                    completionHandler(.failure(.invalidJSONResponse))
                }
            }
        }
    }
}
