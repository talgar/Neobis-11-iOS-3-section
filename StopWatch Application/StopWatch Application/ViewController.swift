//
//  ViewController.swift
//  StopWatch Application
//
//  Created by admin on 24.09.2020.
//  Copyright © 2020 Talgar. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

   
    var player = AVAudioPlayer()

    var toggleState = 1
    
    
    
    @IBOutlet weak var labelF: UILabel!
    
    var seconds  = 0
    var minutes = 0
    var hour  = 0
    // timer
    
    var timer = Timer()
    
    var startTime = TimeInterval()
    
    @IBAction func playPauseButtonF(_ sender: Any) {
    
        let playPauseBtnF = sender as! UIButton
        if toggleState == 1 {
            player.play()
            toggleState = 2
            playPauseBtnF.setImage(UIImage(named:"pause"),for:UIControl.State.normal)
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController.action), userInfo: nil, repeats: true)
        } else {
            player.pause()
            toggleState = 1
            playPauseBtnF.setImage(UIImage(named:"play"),for:UIControl.State.normal)
            timer.invalidate()
        }
    }
    
    @IBAction func playPauseButtonB(_ sender: Any) {
        let playPauseBtnB = sender as! UIButton
        if toggleState == 1 {
            player.play()
            toggleState = 2
            playPauseBtnB.setImage(UIImage(named:"pause"),for:UIControl.State.normal)
        } else {
            player.pause()
            toggleState = 1
            playPauseBtnB.setImage(UIImage(named:"play"),for:UIControl.State.normal)
        }
        
    }
    
    @objc func action() {
seconds += 1
 labelF.text = String(TimeInterval(seconds))
    
    }
    
    @IBAction func updateButtonF(_ sender: Any) {
        timer.invalidate()
        seconds = 0
        labelF.text = "0"

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

}

    

