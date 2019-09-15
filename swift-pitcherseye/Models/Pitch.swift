//
//  Pitch.swift
//  swift-pitcherseye
//
//  Created by Connor Dean on 9/14/19.
//  Copyright © 2019 Connor Dean. All rights reserved.
//

import Foundation

class Pitch {
    var isStrike: Bool
    var location: Int
    
    init(isStrike: Bool, location: Int) {
        self.isStrike = isStrike
        self.location = location
    }
}
