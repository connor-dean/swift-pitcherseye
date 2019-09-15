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
    var pitcher = Pitcher(firstName: "Connor", lastName: "Dean", pitchCount: 0)
    
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func registerPitch(sender: AnyObject) {
        guard let button = sender as? UIButton else {
            return
        }
        
        let location = button.tag
        
        let pitch = Pitch(isStrike: true, location: location)
        
        pitcher.incrementPitchCount(result: pitch)
        pitcher.incrementLocationCount(result: pitch.location)
    }
}
