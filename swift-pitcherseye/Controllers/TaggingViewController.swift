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
        
        return counts
    }
    
    func sortedLocationCount(location: Dictionary<Int, Int>) -> [Int] {
        var locations: [Int] = [
            0, 0 , 0, 0, 0, 0, 0, 0, 0
        ]
        
        let sortedLocation = location.sorted(by: <)
        
        for (key, value) in sortedLocation {
            locations[key] = value
        }
        
        return locations
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
    
    // Undo
    @IBOutlet weak var undoButton: UIButton!
    
    // Stats labels
    @IBOutlet weak var pitcherNameLabel: UILabel!
    @IBOutlet weak var pitchCountLabel: UILabel!
    @IBOutlet weak var strikeCountLabel: UILabel!
    @IBOutlet weak var ballCountLabel: UILabel!
    @IBOutlet weak var upperLeftCountLabel: UILabel!
    @IBOutlet weak var upperMiddleCountLabel: UILabel!
    @IBOutlet weak var upperRightCountLabel: UILabel!
    @IBOutlet weak var centerLeftCountLabel: UILabel!
    @IBOutlet weak var centerMiddleCountLabel: UILabel!
    @IBOutlet weak var centerRightCountLabel: UILabel!
    @IBOutlet weak var lowerLeftCountLabel: UILabel!
    @IBOutlet weak var lowerMiddleCountLabel: UILabel!
    @IBOutlet weak var lowerRightCountLabel: UILabel!
    
    
    override func viewDidLoad() {
        pitcherNameLabel.text = pitcher.returnFullName()
        super.viewDidLoad()
    }
    
    @IBAction func registerPitch(sender: AnyObject) {
        guard let button = sender as? UIButton else {
            return
        }
        
        location = button.tag
        
        let pitch = Pitch(isStrike: true, location: location)
        
        let locationCounts = pitchStack.locationCounts()
        
        let locations = pitchStack.sortedLocationCount(location: locationCounts)
        
        pitchStack.push(pitch)
        updateCountLabels(locations: locations)
    }
    
    @IBAction func undoPitch(_ sender: Any) {
        if pitchStack.length() > 0 {
            pitchStack.pop()
        } else {
            print("The stack is empty.")
        }
    }
    
    func updateCountLabels(locations: [Int]) {
        pitchCountLabel.text = String(pitchStack.length())
        strikeCountLabel.text = String(pitchStack.length())
        upperLeftCountLabel.text = String(locations[0])
        upperMiddleCountLabel.text = String(locations[1])
        upperRightCountLabel.text = String(locations[2])
        centerLeftCountLabel.text = String(locations[3])
        centerMiddleCountLabel.text = String(locations[4])
        centerRightCountLabel.text = String(locations[5])
        lowerLeftCountLabel.text = String(locations[6])
        lowerMiddleCountLabel.text = String(locations[7])
        lowerRightCountLabel.text = String(locations[8])
    }
}
