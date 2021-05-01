//
//  ServerManager.swift
//  CRMClient
//
//  Created by Dastan Mambetaliev on 14/3/21.
//  Copyright © 2021 Dastan Mambetaliev. All rights reserved.

import UIKit
import Alamofire

class ServerManager: HTTPRequestManager  {
    
    class var shared: ServerManager {
        struct Static {
            static let instance = ServerManager()
        }
        return Static.instance
    }
}
//

extension ServerManager {
    
    func getCryptoCourse(urls: String, _ completion: @escaping (Json4Swift_Base) -> Void, _ error: @escaping (String) -> Void) {
        let header: [String: String] = [
            "Content-Type": "application/json"
        ]
        self.get(url: urls, header: header) { (data) in
            do {
                guard let data = data else {return}
                let courseList = try JSONDecoder().decode(Json4Swift_Base.self, from: data)
                
                DispatchQueue.main.async {
                    completion(courseList)
                }
            } catch let err {
                error(err.localizedDescription)
         print(err.localizedDescription)
         
            }
        } error: { (error) in
            
        }
    }
    
    func getCryptoHistory(urls: String, _ completion: @escaping (Json4Swift_History) -> Void, _ error: @escaping (String) -> Void) {
        let header: [String: String] = [
            "Content-Type": "application/json"
        ]
        self.get(url: urls, header: header) { (data) in
            do {
                guard let data = data else {return}
                let historyList = try JSONDecoder().decode(Json4Swift_History.self, from: data)
                DispatchQueue.main.async {
                    completion(historyList)
                }
            } catch let err {
                error(err.localizedDescription)
         print(err.localizedDescription)
            }
        } error: { (error) in
            
        }

    }
    
}

    //    func getBalanceList(token: String, _ completion: @escaping (BalanceStruct) -> Void, _ error: @escaping (String) -> Void){
    ////
    //        let header: [String: String] = [
    //            "Authorization": "Bearer \(token)"
    //        ]
    //
    //        self.get(url: "https://neobis.herokuapp.com/account/get", header: header, completion: {
    //            (data) in
    //            do {
    //                guard let data = data else {return}
    //                let balanceList = try JSONDecoder().decode(BalanceStruct.self, from: data)
    //                DispatchQueue.main.async {
    //                    completion(balanceList)
    //                }
    //            } catch let err {
    //                       error(err.localizedDescription)
    //                   }
    //               }, error: error)
    //        }
    //
    
    
    

