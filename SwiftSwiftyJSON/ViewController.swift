//
//  ViewController.swift
//  SwiftSwiftyJSON
//
//  Created by Marcelo Sampaio on 12/13/16.
//  Copyright © 2016 Marcelo Sampaio. All rights reserved.
//

import UIKit
import SwiftyJSON

class ViewController: UIViewController {

    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
    
        parseJSON()

    }

    
    
    // MARK: - JSON Helper
    private func parseJSON() {
        
        let path = Bundle.main.path(forResource: "JSONSource", ofType: "json") as String!
        let jsonData = NSData(contentsOfFile: path!) as NSData!
        
        let readableJson = JSON(data: jsonData as! Data, options: JSONSerialization.ReadingOptions.mutableContainers, error: nil)

        print("**** readableJson: \(readableJson)")
        
        let json = JSON(data: jsonData as! Data)
        let daseResponse = DaseResponse.init(json: json)
        
        let username = daseResponse.user?.name
        
        print ("***** 👉 username: \(username!)")
        

        
    }
    
    
        
        
        
//         main loop
//        for (_, object) in readableJson {
//
//            print("***** 👉 looping: \(object)")
//            
////            let user = User.init(id: object["id"].stringValue, email: object["email"].stringValue, name: object["name"].stringValue)
////            
////            print("****** name: \(user.name)  email: \(user.email)  id: \(user.id)")
//        }
//    }

}
