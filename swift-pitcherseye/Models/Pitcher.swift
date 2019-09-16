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
    
    init(firstName: String, lastName: String, pitchCount: Int) {
        self.firstName = firstName
        self.lastName = lastName
        self.pitchCount = pitchCount
    }
}

extension Pitcher {
    func returnFullName() -> String {
        return firstName + " " + lastName
    }
}
