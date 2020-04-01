//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation


class ViewController: UIViewController {
    
    var secondsRemaining = 60
    
    var timer : Timer?
    
    let eggTimes = ["Soft" :5000, "Medium" : 7000 , "Hard" : 12000]

    @IBOutlet weak var titleLabel: UILabel!
    var player: AVAudioPlayer!


    @IBOutlet weak var progressView: UIProgressView!
    @IBAction func onPressed(_ sender: UIButton) {
        
        titleLabel.text = "Running"
        
        if timer == nil {
            secondsRemaining = eggTimes[sender.currentTitle!]!
            let totalTime = secondsRemaining
            
            self.progressView.setProgress(0, animated: true)

            timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { (it : Timer) in
                if self.secondsRemaining > 0 {
                    print ("\(self.secondsRemaining) seconds")
                    self.secondsRemaining -= 100
                    let percent = Float(totalTime - self.secondsRemaining) / Float(totalTime)
                    self.progressView.setProgress(percent, animated: true)

                } else {

                    self.secondsRemaining = 60
                    self.titleLabel.text = "Done"
                    it.invalidate()
                    self.timer = nil
                    self.playSound()

                }
            }
        }
    }
    
    func playSound() {

        let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
        player = try! AVAudioPlayer(contentsOf: url!)
        player?.play()
    }
}
