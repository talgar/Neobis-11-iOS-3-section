//
//  ViewController.swift
//  StopWatch Application
//
//  Created by admin on 24.09.2020.
//  Copyright © 2020 Talgar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var labelF: UILabel!
    @IBOutlet weak var labelB: UILabel!
    
    @IBOutlet weak var playPauseButtonF: UIButton!
    @IBOutlet weak var playPauseButtonB: UIButton!

    var secondsF  = 0
    var secondsB  = 10
    var timer = Timer()
    var isTimerRunning = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func playPauseActionF(_ sender: Any) {
    
        if isTimerRunning == false {
            runTimerF()
            playPauseButtonF.setImage(UIImage(named:"pause"),for:UIControl.State.normal)
        } else {
            isTimerRunning = false
            timer.invalidate()
            playPauseButtonF.setImage(UIImage(named:"play"),for:UIControl.State.normal)
        }
    }
    
    @IBAction func playPauseActionB(_ sender: Any) {
        
        if isTimerRunning == false {
            runTimerB()
            playPauseButtonB.setImage(UIImage(named:"pause"),for:UIControl.State.normal)
        } else {
            isTimerRunning = false
            timer.invalidate()
            playPauseButtonB.setImage(UIImage(named:"play"),for:UIControl.State.normal)
        }
        
    }
    
    func runTimerF() {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: (#selector(startF)), userInfo: nil, repeats: true)
        isTimerRunning = true
    }
    func runTimerB() {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: (#selector(startB)), userInfo: nil, repeats: true)
        isTimerRunning = true
    }
    
    
    @objc func startF() {
        secondsF += 1
        labelF.text = timeString(time: TimeInterval(secondsF))
    }
    
    @objc func startB() {
        if secondsB < 1 {
            timer.invalidate()
        } else {
            secondsB -= 1
            if secondsB == 0 {
                playPauseButtonB.setImage(UIImage(named: "play"), for: .normal)
            }
            labelB.text = timeString(time: TimeInterval(secondsB))
        }
    }
    
    @IBAction func updateButtonF(_ sender: Any) {
        timer.invalidate()
        isTimerRunning = false
        playPauseButtonF.setImage(UIImage(named: "play"), for: .normal)
        secondsF = 0
        labelF.text = timeString(time: TimeInterval(secondsF))
    }
    
    @IBAction func updateButtonB(_ sender: Any) {
        timer.invalidate()
        isTimerRunning = false
        playPauseButtonB.setImage(UIImage(named: "play"), for: .normal)
        secondsB = 10 //MARK: add slider
        labelB.text = timeString(time: TimeInterval(secondsB))
    }
    

    func timeString(time: TimeInterval) -> String {
        let hours = Int(time) / 3600
        let minute = Int(time) / 60 % 60
        let seconds = Int(time) % 60
        
        return String(format:"%02i:%02i:%02i", hours,minute,seconds)
    }
}

    

