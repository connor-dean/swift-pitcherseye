//
//  TaggingViewController.swift
//  swift-pitcherseye
//
//  Created by Connor Dean on 8/22/19.
//  Copyright © 2019 Connor Dean. All rights reserved.
//

import UIKit

class TaggingViewController: UIViewController {
    
    // Temporary until rosters are integrated
    private var pitcher = Pitcher(firstName: "Connor", lastName: "Dean", pitchCount: 0)
    
    private var location = 0
    private var lastPitchLocation = 0
    
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
        
        trackLastPitch(pitch: pitch)
        pitcher.incrementPitchCount(result: pitch)
        pitcher.incrementLocationCount(result: pitch.location)
    }
    
    @IBAction func undoPitch(_ sender: Any) {
        let pitch = Pitch(isStrike: true, location: location)
        pitcher.decrementPitchCount(result: pitch)
        pitcher.decrementLocationCount(result: lastPitchLocation)
    }
    
    func trackLastPitch(pitch: Pitch) {
        lastPitchLocation = pitch.location
    }
}
