//
//  Line.swift
//  SwiftIIM
//
//  Created by LOZACH Antoine on 19/11/2019.
//  Copyright © 2019 LOZACH Antoine. All rights reserved.
//

import UIKit

class Line: Decodable {
    var id: Int!
    var code: String!
    var name: String!
    var directions: String!
    
    init(code: String, name: String, directions: String) {
        self.code = code
        self.name = name
        self.directions = directions
    }
}
