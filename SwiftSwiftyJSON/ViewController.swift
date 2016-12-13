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
        
//        let name = readableJson["people","person","name"]
        let name = readableJson["people"]["person"]["name"]
        
        
        
        print("**** name: \(name)")
        
        
    }


}

