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

    var secondsF  = 0
    var timer = Timer()
    var secondsB = 0
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
        if sliderTime.value < 1 {
        timer.invalidate()
        } else {
            sliderTime.value -= 1
            if sliderTime.value == 0 {
                sliderTime.setValue(0, animated: true)
                playPauseButtonB.setImage(UIImage(named: "play"), for: .normal)
            }
            labelB.text = timeString(time: TimeInterval(sliderTime.value))
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
        sliderTime.value = Float(Int(sender.value))
        
    }
}

    

