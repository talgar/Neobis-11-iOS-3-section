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
    @IBOutlet weak var sliderTime: UISlider!
    @IBOutlet weak var playPauseButtonF: UIButton!
    @IBOutlet weak var playPauseButtonB: UIButton!

    var seconds = 0
    var timer = Timer()
    var isTimerRunning = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
        seconds += 1
        labelF.text = timeString(time: TimeInterval(seconds))
    }
    
    @objc func startB() {
        if sliderTime.value < 1 {
            timer.invalidate()
            playPauseButtonB.setImage(UIImage(named: "play"), for: .normal)
        } else {
            sliderTime.value -= 1
            labelB.text = timeString(time: TimeInterval(sliderTime.value))
        }
    }
    
    @IBAction func updateButtonF(_ sender: Any) {
        timer.invalidate()
        isTimerRunning = false
        playPauseButtonF.setImage(UIImage(named: "play"), for: .normal)
        seconds = 0
        labelF.text = timeString(time: TimeInterval(seconds))
    }
    
    @IBAction func updateButtonB(_ sender: Any) {
        timer.invalidate()
        isTimerRunning = false
        playPauseButtonB.setImage(UIImage(named: "play"), for: .normal)
        sliderTime.value = 0
        labelB.text = timeString(time: TimeInterval(sliderTime.value))
        sliderTime.setValue(0, animated: true)
    }
    
    func timeString(time: TimeInterval) -> String {
        let hours = Int(time) / 3600
        let minute = Int(time) / 60 % 60
        let seconds = Int(time) % 60
        
        return String(format:"%02i:%02i:%02i", hours,minute,seconds)
    }
    
    @IBAction func sliderTime(_ sender: UISlider) {
        labelB.text = timeString(time: TimeInterval(sender.value))
    }
}


