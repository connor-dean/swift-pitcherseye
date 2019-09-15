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
    var pitchCount_1: Int? = 0
    var pitchCount_2: Int? = 0
    var pitchCount_3: Int? = 0
    var pitchCount_4: Int? = 0
    var pitchCount_5: Int? = 0
    var pitchCount_6: Int? = 0
    var pitchCount_7: Int? = 0
    var pitchCount_8: Int? = 0
    var pitchCount_9: Int? = 0
    
    init(firstName: String, lastName: String, pitchCount: Int) {
        self.firstName = firstName
        self.lastName = lastName
        self.pitchCount = pitchCount
    }
}

extension Pitcher {
    func incrementPitchCount(result: Pitch) {
        pitchCount += 1
        
        print("isStrike: \(result.isStrike)\nlocation: \(result.location) \npitchCount: \(pitchCount)")
    }
    
    func incrementLocationCount(result: Int) {
        switch result {
        case 1:
            pitchCount_1! += 1
            print("pitchCount_1: \(pitchCount_1!)")
        case 2:
            pitchCount_2! += 1
        case 3:
            pitchCount_3! += 1
        case 4:
            pitchCount_4! += 1
        case 5:
            pitchCount_5! += 1
        case 6:
            pitchCount_6! += 1
        case 7:
            pitchCount_7! += 1
        case 8:
            pitchCount_8! += 1
        case 9:
            pitchCount_9! += 1
        default:
            print("Whoops, something went wrong!")
        }
    }
}
