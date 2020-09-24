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
    
    @IBAction func playPause(_ sender: UIButton) {
    
        var playBtn = sender as! UIButton
        if toggleState == 1 {
            player.play()
            toggleState = 2
            playBtn.setImage(UIImage(named:"pause"),for:UIControl.State.normal)
        } else {
            player.pause()
            toggleState = 1
            playBtn.setImage(UIImage(named:"play"),for:UIControl.State.normal)
        }
    }

    @IBAction func updateButton(_ sender: Any) {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

}

    

