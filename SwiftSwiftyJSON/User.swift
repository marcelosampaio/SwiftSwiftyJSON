//
//  User.swift
//  SwiftSwiftyJSON
//
//  Created by Marcelo Sampaio on 12/13/16.
//  Copyright © 2016 Marcelo Sampaio. All rights reserved.
//

import Foundation

struct User {
    let id: Int
    let email: String
    let name: String
    
    init(id: Int, email: String, name: String) {
        self.id = id
        self.email = email
        self.name = name
    }
}

