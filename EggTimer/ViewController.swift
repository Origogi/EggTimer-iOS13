//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var secondsRemaining = 60
    
    var timer : Timer?
    
    let eggTimes = ["Soft" :5, "Medium" : 7 , "Hard" : 12]

    @IBOutlet weak var titleLabel: UILabel!

    @IBAction func onPressed(_ sender: UIButton) {
        
        titleLabel.text = "Running"
        
        if timer == nil {
            
            secondsRemaining = eggTimes[sender.currentTitle!]!

            timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { (it : Timer) in
                if self.secondsRemaining > 0 {
                    print ("\(self.secondsRemaining) seconds")
                    self.secondsRemaining -= 1
                } else {
                    self.secondsRemaining = 60
                    self.titleLabel.text = "Done"
                    it.invalidate()
                    self.timer = nil
                }
            }
        }
    }
}
