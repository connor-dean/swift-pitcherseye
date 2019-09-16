//
//  Pitcher.swift
//  swift-pitcherseye
//
//  Created by Connor Dean on 9/14/19.
//  Copyright © 2019 Connor Dean. All rights reserved.
//

import Foundation

class Pitcher {
    var firstName: String
    var lastName: String
    var pitchCount: Int = 0
    var pitchCountLocations: [Int : Int] = [
        1 : 0,
        2 : 0,
        3 : 0,
        4 : 0,
        5 : 0,
        6 : 0,
        7 : 0,
        8 : 0,
        9 : 0,
    ]
    
    
    init(firstName: String, lastName: String, pitchCount: Int, pitchCountLocations: [Int: Int]) {
        self.firstName = firstName
        self.lastName = lastName
        self.pitchCount = pitchCount
        self.pitchCountLocations = pitchCountLocations
    }
}

extension Pitcher {
    func returnFullName() -> String {
        return firstName + " " + lastName
    }
}
