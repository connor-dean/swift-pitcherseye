//
//  HomeViewController.swift
//  swift-pitcherseye
//
//  Created by Connor Dean on 7/30/19.
//  Copyright © 2019 Connor Dean. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var btnStatistics: UIButton!
    @IBOutlet weak var btnTagEvent: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Update UI
        btnStatistics.layer.cornerRadius = 5
        btnTagEvent.layer.cornerRadius = 5
        btnStatistics.clipsToBounds = true
        btnTagEvent.clipsToBounds = true
    }


}

