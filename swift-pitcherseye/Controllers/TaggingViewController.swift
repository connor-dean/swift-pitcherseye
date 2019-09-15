//
//  TaggingViewController.swift
//  swift-pitcherseye
//
//  Created by Connor Dean on 8/22/19.
//  Copyright © 2019 Connor Dean. All rights reserved.
//

import UIKit

struct PitchStack {
    private var items: [Pitch] = []
    
    func peek() -> Pitch {
        guard let latestPitch = items.first else { fatalError("This stack is empty.") }
        return latestPitch
    }
    
    mutating func pop() -> Pitch? {
        return items.removeFirst()
    }
    
    mutating func push(_ element: Pitch) {
        items.insert(element, at: 0)
    }
    
    func length() -> Int {
        return items.count
    }
    
    func locationCounts() -> Dictionary<Int, Int> {
        var pitchLocations: [Int] = []
        
        for locations in items {
            pitchLocations.append(locations.location)
        }
        
        let mappedItems = pitchLocations.map { ($0, 1) }
        
        let counts = Dictionary(mappedItems, uniquingKeysWith: +)

        print(counts.sorted(by: <))
        
        return counts
    }
}

class TaggingViewController: UIViewController {
    
    // Temporary until rosters are integrated
    private var pitcher = Pitcher(firstName: "Connor", lastName: "Dean", pitchCount: 0, pitchCountLocations: [0 : 0])
    
    private var pitchStack = PitchStack()
    
    private var location = 0
    
    // High
    @IBOutlet weak var taggingButton_1: UIButton!
    @IBOutlet weak var taggingButton_2: UIButton!
    @IBOutlet weak var taggingButton_3: UIButton!
    
    // Middle
    @IBOutlet weak var taggingButton_4: UIButton!
    @IBOutlet weak var taggingButton_5: UIButton!
    @IBOutlet weak var taggingButton_6: UIButton!
    
    // Low
    @IBOutlet weak var taggingButton_7: UIButton!
    @IBOutlet weak var taggingButton_8: UIButton!
    @IBOutlet weak var taggingButton_9: UIButton!
    
    @IBOutlet weak var undoButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func registerPitch(sender: AnyObject) {
        guard let button = sender as? UIButton else {
            return
        }
        
        location = button.tag
        
        let pitch = Pitch(isStrike: true, location: location)
        
        pitchStack.push(pitch)
        pitchStack.locationCounts()
    }
    
    @IBAction func undoPitch(_ sender: Any) {
        if pitchStack.length() > 0 {
            pitchStack.pop()
        } else {
            print("The stack is empty.")
        }
        dump(pitchStack)
    }
}
